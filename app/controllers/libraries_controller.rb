class LibrariesController < ApplicationController

  def index
    @libraries = Library.all.uniq
    respond_to do |f|
      f.html
      f.json {render :json => {:libraries => @libraries.as_json}}
    end
  end

  def new
    @library = Library.new()
  end

  def create
    new_library = params.require(:library).permit(:url)
    library = Library.create(new_library)
    LinksWorker.perform_async(library.id)
    redirect_to libraries_path
  end


end
