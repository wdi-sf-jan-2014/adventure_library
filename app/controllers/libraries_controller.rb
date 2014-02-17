class LibrariesController < ApplicationController
  include LibrariesHelper
  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => {"libraries" => @libraries}}
    end
  end

  def new 
    @library = Library.new
  end

  def create
    new_library = params.require(:library).permit(:url)
    clean_url = url_cleanup(new_library[:url])
    library = Library.find_or_create_by(url: clean_url)
    LibrariesWorker.perform_async(library.id)
    redirect_to adventures_path


  end
  
   def show
    @library = Library.find(params[:id])
  end
end
