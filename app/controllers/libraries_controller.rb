class LibrariesController < ApplicationController

  def index
    @libraries = Library.all

    respond_to do |f|
      f.html
      f.json { render json: { libraries: @libraries.as_json(only: :url) } }
    end
  end
  
end
