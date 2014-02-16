class LibrariesController < ApplicationController
  def new
  	@library = Library.new
  end
  def create
    library = Library.create(params[:library].permit(:url))
    #LinksWorker.perform_async(library.id)

	 redirect_to libraries_path
  end 


  def get_libraries link
  	response = Typhoeus.get(link)
  end

  def index
  	@libraries = Library.all
  	    respond_to do |f|
		    f.html 
		    f.json { render :json => {:libraries => @libraries}}
        end
  end
end
