class LibrariesController < ApplicationController
  def index
  	@libraries = Library.all
  end

  def show
  	@library = Library.find_by_id(params[:id])
  end

  def new
  	@library = Library.new
  end

  def create
  	new_lib_link = params.require(:library).permit(:url)
  end
end
