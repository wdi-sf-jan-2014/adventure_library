class LibrariesController < ApplicationController
  def index
  	@libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => @libraries.as_json}
    end
  end

  def show
  	@library = Library.find_by_id(params[:id])
  end

  def new
  	@library = Library.new
  end

  def create
  	new_lib_link = params.require(:library).permit(:url)
    library = Library.create(new_lib_link)
    binding.pry

    LibrariesWorker.perform_async(library.id) unless library.id == nil


    redirect_to root_path

  end
end
