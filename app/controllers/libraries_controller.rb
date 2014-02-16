class LibrariesController < ApplicationController
  def index
    @library = Library.all
    respond_to do |format|
      format.html
      format.json { render json: @library }
    end
  end

  def new
    @library = Library.new
  end

  def create
    new_param = params.require(:library).permit(:url)
    @library = Library.create(new_param)
    redirect_to libraries_path
  end

end
