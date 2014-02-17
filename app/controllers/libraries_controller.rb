class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    respond_to do |f| 
      f.html 
      f.json { render :json => { "libraries" => @libraries.as_json }}
    end 
  end 

  def new 
    @library = Library.new
  end 

  def show 
    @library = Library.find_by_id(params[:id])
  end 

  
  def create
    new_library = params.require(:library).permit(:url)
    library = Library.create(new_library)
    LinksWorker.perform_async(library.id) unless library.id == nil

    redirect_to 
  end 

  def destroy
    Library.find(params[:id]).delete
    redirect_to root_path 
  end



end


  

 










