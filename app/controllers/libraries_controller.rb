class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => {"libraries" => @libraries.as_json(except: :id)} }
    end
  end  

def new
end

def create
  url = params.require(:url).permit(:url)
  if url[-1] != '/'
    url += '/'
  end
  HardWorker.perform_async(url)
end
