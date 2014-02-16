class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => {"libraries" => @libraries}}
    end
  end

  def new 
    @library = Library.new
  end

   def create
    if Library.where(url: params[:library]["url"]) == []
      create_library = params.require(:library).permit(:url)
      @library = Library.create(create_library)
      AdventuresWorker.perform_async(@library.id)
      LibrariesWorker.perform_async(@library.id)
      redirect_to adventures_path
    else
      redirect_to libraries_path
    end
   end
end
