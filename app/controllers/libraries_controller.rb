class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => { :libraries => @libraries.as_json }}
    end
  end
  
  def new
    @library = Library.new
  end

  def create
    new_lib = params.require(:library).permit(:url)
    library = Library.create(new_lib)
    new_advs = Typhoeus.get("#{library.url}"+"/adventures.json")
    adventures = JSON.parse(new_advs.body)
    adventures["adventures"].each do |a|
      adventure = library.adventures.build(:title => a["title"], :author => a["author"], :guid => a["guid"])
      if adventure.save
        a["pages"].each do |p|
          adventure.pages.create(:name => p["name"], :text => p["text"])
        end
      end
    end
  end

    

end