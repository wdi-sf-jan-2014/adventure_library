class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json {render :json => @libraries.as_json(root: true)}
    end
  end

  def new
    @library = Library.new()
  end

  def create
    new_library = params.require(:library).permit(:url)
    Library.create(new_library)
    redirect_to libraries_path
  end

  

end
