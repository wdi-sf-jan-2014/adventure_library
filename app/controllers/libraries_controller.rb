class LibrariesController < ApplicationController
  
  def index
    @libraries = Library.all
  end

  def new
    @library = Library.new
  end

  def create
    library = Library.new(get_lib_params)

    if library.save
      redirect_to libraries_path
    else
      flash[:warning] = "Sorry, your URL didn't work. Try again."
      render :new
    end

  end

  private

  def get_lib_params
    params.require(:library).permit(:url)
  end

end
