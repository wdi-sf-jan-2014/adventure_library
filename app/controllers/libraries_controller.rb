class LibrariesController < ApplicationController
  def new
    @library = Library.new
  end

  def show
    @library = Library.find(params[:id])
    respond_to do |f|
      f.html
      f.json { render :json => @library.as_json}
    end
  end

  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => @libraries}
    end
  end

  def create
    if Library.find_by(url: params['url']).nil?
      LibrariesWorker.perform_async(url)
    else
      library = Library.find_by(url: params['url'])
      redirect_to library_path(library.id)
    end
    respond_to do |f|
      f.html { redirect_to root_path }
      f.json { render :json => @library }
    end
  end
end
