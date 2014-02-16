class LibrariesController < ApplicationController

  def index

    @all_libraries = Library.all

    respond_to do |f|
      f.html
      f.json {render :json => {libraries: @all_libraries}}
    end
  end



end
