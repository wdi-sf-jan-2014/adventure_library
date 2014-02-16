class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    @libraries.each do |library|
      AdventuresWorker.perform_async(library.id)
    end
    respond_to do |f|
      f.html
      f.json { render :json => {"libraries" => @libraries} }
    end
  end

  def show
    @library = Library.find(params[:id])
  end

  def new
    @library = Library.new
    
  end

  def create
    library = params.require(:library)[:url]
    @library = Library.create(url: library)
  # binding.pry
      LibrariesWorker.perform_async(@library.id)
    # redirect_to adventures_path
    # else
    redirect_to libraries_path

  end

  def destroy
    Library.find(params[:id]).delete
    redirect_to libraries_path
  end



  
end
