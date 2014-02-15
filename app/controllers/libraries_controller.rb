class LibrariesController < ApplicationController
  
  def index
    @libraries = Library.all

    respond_to do |f|
      f.html
      f.json { render :json => @libraries, :status => 200 }
    end

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
