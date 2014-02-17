class LibrariesController < ApplicationController

  def index
    @libraries = Library.all

    respond_to do |format|
      format.html
      format.json {render :json => {:libraries => @libraries.as_json(only: [:url])}}
    end

  end

  def new
    @library = Library.new
  end

  def create
    url = params.require(:library)[:url]

    # check if that library exists, if not, create it
    @library = Library.find_by(url: url)
    @library = Library.create(url: url) if @library.nil?

    redirect_to library_path(@library)
  end

  def show
    
  end

end
