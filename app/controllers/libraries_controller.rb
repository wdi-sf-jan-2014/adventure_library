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
    new_library = params.require(:library).permit(:url)
    @library = Library.create(new_library)
    LibrariessWorker.perform_async(@library.id)
    redirect_to root_path
  end
end
