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
  end
end
