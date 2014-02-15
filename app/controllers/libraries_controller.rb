class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => {"libraries" => @libraries } }
    end
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.create(library_params)
    if @library.save
      respond_to do |f|
        f.html { redirect_to libraries_path}
        f.json { render :json => @library}
      end
    else
      respond_to do |f|
        f.html { render :new }
        f.json { render :json => :new}
      end
    end
  end

private 
  def library_params
    params.require(:library).permit(:url)
  end
  

end
