class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    respond_to do |f|
      f.html { render :index }
      f.json { render :json => { libraries: @libraries.as_json } }
    end
  end

  def create
    parameters = params.require(:library).permit(:url)
    LibraryWorker.perform_async(parameters)
    redirect_to adventures_path
  end

end