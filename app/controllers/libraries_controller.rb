class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => { :libraries => @libraries.as_json(only: :url) }}
    end
  end
  
  def new
    @library = Library.new
  end

  def create
    lib_params = params.require(:library).permit(:url)
    home_lib = { "url" => lib_params["url"]}
    response = Typhoeus.get("#{home_lib["url"]}"+"/libraries.json")
    unless response.code == "0"
      lib_hash = JSON.parse(response.body)
      libraries = lib_hash["libraries"]
      libraries << home_lib
      LibraryWorker.perform_async(libraries)
    end
    redirect_to adventures_path
  end
end