class LibrariesController < ApplicationController
  def new
    @library = Library.new
  end

  def show
    @library = Library.find(params[:id])
  end

  def create
    new_library = params.require(:library).permit(:url)
    @library = Library.create(new_library)
  end
end
