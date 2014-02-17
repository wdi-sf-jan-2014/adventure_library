class LibrariesController < ApplicationController

  include LibrariesHelper

  def new
    @library = Library.new
  end

  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => { libraries: @libraries.as_json } }
    end
  end

  def create
    new_url = params.require(:library).permit(:url)
    clean_url = url_cleanup(new_url[:url])
    lib = Library.find_or_create_by(url: clean_url)
    LibrariesWorker.new.perform(lib.id)

    redirect_to libraries_path
  end
end
