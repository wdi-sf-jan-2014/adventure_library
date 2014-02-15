class LibrariesController < ApplicationController
 
  def index
    @libraries = library.all
    respond_to do |format|
    format.html
    format.json {render json: @libraries} 
    end 
  end

  def create
    @library = params.require(:library).permit(:title)
     LibraryWorker.perform_async(library.id)
     redirect_to '/libraries'
  end


  def create
    url = params.require(:library)[:url]
    @library = Library.create(url: url)
    LinksWorker.perform_async(@library.id)
    respond_to do |f|
      # go fetch the content of the library
      # f.html { redirect_to site_path(@site) }
      # f.json { render :json => @site }
  end

end
