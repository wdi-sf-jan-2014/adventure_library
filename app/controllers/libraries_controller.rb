class LibrariesController < ApplicationController

  def index
    @libraries = Library.all

    respond_to do |format|
      format.html
      format.json { render json: { libraries: @libraries.as_json } }
    end
  end

  def new
  end

  def create


  end


end