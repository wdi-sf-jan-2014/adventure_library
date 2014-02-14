class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end

  def new
    @library = Library.new
  end

  def create
  end

end
