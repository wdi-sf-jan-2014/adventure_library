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
      f.json { render :json => @libraries.as_json(only: :url)}
    end
  end

  def create
    #binding.pry
    if params.nil?
      redirect_to root_path
    else
      LibrariesWorker.perform_async(params['library']['url'])
      redirect_to libraries_path
    end
  end
end
