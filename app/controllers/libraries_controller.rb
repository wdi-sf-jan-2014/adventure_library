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
    new_lib = params.require(:library).accept(:url)
    library = Library.create(new_lib)
    response = Typhoeus.get("#{library.url}"+"/libraries.json")
    JSON.parse(library.url)
    response["adventures"].each do |adv|
      library.adventures.create(:title => adv["title"], :authors => adv["author"], :guid => adv["guid"])
      adv.pages.each do |page|
        adventure.pages.create(:name => page["name"], :text => page["text"])
      end
    end
  end

    

end