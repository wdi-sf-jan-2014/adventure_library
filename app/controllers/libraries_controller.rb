class LibrariesController < ApplicationController

  include LibrariesHelper

  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => { libraries: @libraries.as_json } }
    end
  end

  def new
    @library = Library.new
  end

  def create
    new_url = params.require(:library).premit(:url)
    
    clean_url = url_cleanup(new_url[:url])
    lib = Library.find_or_create_by(url: clean_url)
    
    LibrariesHelper.perform_async(lib.id)
    
    redirect_to adventures_path(lib.id)
  end
end
