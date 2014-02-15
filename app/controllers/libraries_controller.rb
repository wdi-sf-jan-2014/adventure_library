class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    respond_to do |f|
      f.json { render :json => { libraries: @libraries.as_json } }
    end
  end
end
