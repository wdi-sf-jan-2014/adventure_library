class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => {"libraries" => @libraries} }
    end
  end

  def new
    @library = Library.new
  end

  def create
    library = params.require(:library).permit(:url)
    @library = Library.create!(library)
    # LinksWorker.perform_async(@library.id)
    response = Typhoeus.get("#{@library.url}adventures.json")
    result = JSON.parse(response.body)
    result["adventures"].each do |adventure|
      obtained_library = @library.adventures.create!(:title => adventure["title"], :author => adventure["author"],
        :guid => adventure["guid"])
        adventure["pages"].each do |page|
          obtained_page = obtained_library.pages.create!(:name => page["name"], :text => page["text"])
          binding.pry 
        end

    end
    
    redirect_to libraries_path
  end

end
