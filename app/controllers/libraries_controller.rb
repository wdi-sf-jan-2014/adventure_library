class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
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
    LinksWorker.perform_async(@library.id)
    redirect_to adventures_path
  end

end
