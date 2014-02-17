class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    respond_to do |f|
      f.html {redirect_to '/adventures/'}
      f.json { render :json => {"libraries" => @libraries.as_json(except: :id)} }
    end
  end  

  def new
    @library = Library.new()
  end

  def create
    url = params.require(:library).permit(:url)["url"]
    lib = Library.find_by(url: url)
    if lib != nil  #if the seed already exists in the library, do it again anyway in case it has been updated. 
      lib.destroy
    end
    HardWorker.perform_async(url)
    redirect_to '/libraries/'
  end




end
