class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    respond_to do |format|
      format.html
      format.json { render json: { libraries: @libraries.as_json(only: [:url]) }, status: :ok }
    end
  end

  def show
  end

  def create
    LibrariesWorker.perform_async(params["library"]["url"])
  end

end