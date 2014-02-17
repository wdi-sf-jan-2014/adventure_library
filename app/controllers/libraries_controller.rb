class LibrariesController < ApplicationController
  require 'JSON'
  def index
    @library = Library.all
    @new_library = Library.new
    @adventure = Adventure.all
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
    @library = Library.new(new_param)
    if @library.save
      LibraryWorker.perform_async
      redirect_to libraries_path
    else
      render :new
    end
  end

end
