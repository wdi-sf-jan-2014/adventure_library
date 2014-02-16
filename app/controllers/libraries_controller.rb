class LibrariesController < ApplicationController
  def index
  	@libraries = Library.all
	  	respond_to do |f|
        f.html
	  		f.json {render :json => {"libraries" => @libraries.as_json(except: :id)}}
	  	end
  end

  def new
    @library = Library.new
  end

  def create
    #sidekiq worker goes here
    new_library = Library.create(library_params)
    response = Typhoeus.get("#{new_library.url}adventures.json")
    result = JSON.parse(response.body)
    # binding.pry
    result["adventures"].each do |adventure|
      obtained_adventure = new_library.adventures.create!(:title => adventure["title"], :author => adventure["author"], :guid => adventure["guid"])
      
        adventure["pages"].each do |page|
         obtained_pages = obtained_adventure.pages.create!(:name => page["name"], :text => page["text"])
        end
    end
    binding.pry
    redirect_to root_url

  end

  private

  def library_params
    params.require(:library).permit(:url)
  end

end
