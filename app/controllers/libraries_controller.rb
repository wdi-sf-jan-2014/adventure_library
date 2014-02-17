class LibrariesController < ApplicationController
  include LibrariesHelper

  def index
    @libraries = Library.all

    respond_to do |format|
      format.html
      format.json { render json: { libraries: @libraries.as_json(only: :url) } }
    end
  end

  def new
    @library = Library.new
  end

  def create
    new_library = params.require(:library).permit(:url)
    clean_url = url_cleanup(new_library[:url])

    library = Library.find_or_create_by(url: clean_url)

    LibrariesWorker.perform_async(library.id)

    redirect_to adventures_path


  end
end