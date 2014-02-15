class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => {"libraries" => @libraries } }
    end
  end

  def new
    @library = Library.new
  end

  def create
    if Library.where("url != ?", params[:library]["url"]) == nil
      binding.pry
      @library = Library.create(library_params)
      AdventuresWorker.perform_async(@library.id)
      # LibrariesWorker.perform_async(@library.id)
      redirect_to adventures_path
    else
      binding.pry
      redirect_to libraries_path
    end
  end

private 
  def library_params
    params.require(:library).permit(:url)
  end
  

end
