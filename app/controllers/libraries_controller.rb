class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    @libraries.each do |library|
      LinksWorker.perform_async(library.id)
    end
    respond_to do |f|
      f.html
      f.json { render :json => {"libraries" => @libraries} }
    end
  end

  def new
    @library = Library.new
  end

  def create
    library = params.require(:library).permit(:url)
    @library = Library.create!(library)
    LibrariesWorker.perform_async(@library.id)
    redirect_to adventures_path
  end

end
