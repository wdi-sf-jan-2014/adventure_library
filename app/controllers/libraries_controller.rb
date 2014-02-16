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
    home_lib = Library.create(lib_params)
    response = Typhoeus.get("#{home_lib.url}"+"/libraries.json")
    lib_hash = JSON.parse(response.body)
    libraries = lib_hash["libraries"]
    (libraries << { "url" => home_lib.url })
    libraries.each do |l|
      library = Library.new(url: l["url"])
      if library.save
        adv_response = Typhoeus.get("#{library.url}"+"/adventures.json")
        adventure_hash = JSON.parse(adv_response.body)
        adventure_hash["adventures"].each do |a|
          adventure = library.adventures.build(:title => a["title"], :author => a["author"], :guid => a["guid"])
          if adventure.save
            a["pages"].each do |p|
              page = adventure.pages.build(:name => p["name"], :text => p["text"])
              page.save
            end
          end
        end
      end
    end
    redirect_to adventures_path
  end

end