class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => {"libraries" => @libraries} }
    end
  end

  def show
    # @libraries = Library.all
  end

  def new
    @library = Library.new
    
  end

  def create
    library = params.require(:library)[:url]
    @library = Library.create(url: library)
    #start the libray scraping process here. 
    LibrariesWorker.perform_async(@library.id)
    AdventuresWorker.perform_async(@library.id)
    redirect_to adventures_path
    # else
    # redirect_to libraries_path

  end



# A JSON client can GET '/libraries' to get a list of libraries which the current server knows about in JSON format.


# A user can go to a form to enter in the 
# URL of another library server.  
# When a user submits that form, 
# it will start the library scraping process.

  
end
