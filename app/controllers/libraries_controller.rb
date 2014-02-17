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
    lib = Library.create_or_find_by(url: clean_url)
    LibrariesWorker.perform_async(lib.id)

    redirect_to adventures_path
  end
end
