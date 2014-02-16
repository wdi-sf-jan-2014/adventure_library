class LibrariesController < ApplicationController

  def homepage
  end

  def index
  @libraries = Library.all

    respond_to do |f|
      f.html
      f.json { render json: Library.libraries_to_json(@libraries) }  }
    end
  end

  def create
    # lib = params[:library].permit(:name, :url)
    # LibraryWorker.perform_async(lib)

    redirect_to "/libraries"
  end

end
