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

    # get / add the requested library (get if exists, add if not)
    @library = add_new_library(url)

    if @library.nil?
      flash[:error] = "Invalid URL or no results"
      redirect_to '/'
    else
      add_other_libraries(@library)
      redirect_to library_path(@library)
    end
  end

  # show lastest libraries and adventures of given library 
  def show
    @library = Library.find(params[:id])
    @library_list = @library.scrape_libraries
    @adventure_list = @library.scrape_adventures
  end

end
