class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    respond_to do |f|
      f.json { render :json => {"libraries" => @libraries} }
    end
  end

  def show
  end

  def new
  end
end
