class LibrariesController < ApplicationController

  def new
    @library = Library.new
  end

  def index
    @library = Library.all
  end

  def show
    @library = Library.find(params[:id])
    @adventures = @library.adventures
    respond_to do |f|
      f.html
      f.json { render :json => @library}
  end

 end
end
