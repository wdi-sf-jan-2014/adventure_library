class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    respond_to do |f|
      f.json { render :json => {"libraries" => @libraries} }
    end
  end

  def new
  end

  def create
  end
end
