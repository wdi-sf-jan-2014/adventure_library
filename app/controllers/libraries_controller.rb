class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    respond_to do |f|
      f.html 
      f.json { render json: {libraries: @libraries.as_json(only: :url) } }
    end
  end

  def new
    @library = Library.new
  end

  def create
    LibraryWorker.perform_async(params['library']['url'])
    redirect_to adventures_path 
  end

  def show
    @library = Library.find(params[:id])
  end

end



