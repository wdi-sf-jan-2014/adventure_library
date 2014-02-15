class LibrariesController < ApplicationController
  def new
  	@library = Library.new
  end
  def create
    library = Library.create(params[:library].permit(:url))
	 redirect_to libraries_path
  end
  def index
  	@libraries = Library.all
  	    respond_to do |f|
		    f.html 
		    f.json { render :json => @libraries}
        end
  end
end
