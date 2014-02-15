class LibrariesController < ApplicationController
 
  def index
    @libraries = Library.all
    respond_to do |format|
    format.html
    format.json {render json: @libraries} 
    end 
  end

  def create
    new_library = params.require(:library).permit(:url)
      @library = Library.create(new_library)
     LibraryWorker.perform_async(library.id)
     redirect_to '/libraries'
  end


end
