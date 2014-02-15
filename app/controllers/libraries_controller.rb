class LibrariesController < ApplicationController

  def new
    @library = Library.new
  end

  def create
    url = params.require(:library)[:url]
    @library = Library.create(url: url)

  end

  def edit
    @library = Library.find(params[:id])

  end

  def index
    @library = Library.all
  end

  def update
  end

  def show
    @library = Library.find(params[:id])
    @adventures = @library.adventures
    respond_to do |f|
      f.html
      f.json { render :json => @library}
  end

  def delete
    @library = Library.find(params[:id])
    @library.delete
    redirect_to 
  end

end
