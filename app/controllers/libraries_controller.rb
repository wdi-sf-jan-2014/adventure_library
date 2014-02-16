class LibrariesController < ApplicationController
  include LibrariesHelper

  def index
    @libraries = Library.all

    respond_to do |format|
      format.html
      format.json { render json: { libraries: @libraries.as_json(only: :url) } }
    end
  end

  def new
    @library = Library.new
  end

  def create
    new_library = params.require(:library).permit(:url)
    clean_url = url_cleanup(new_library[:url])

    library = Library.find_or_create_by(url: clean_url)


    scrape(library.url)


    @foreign_adventures.each do |adv|
      new_adventure = {title: adv["title"], author: adv["author"], guid: adv["guid"]}

      # it'd be nice if this could also update attributes, but only if they'd changed
      unless Adventure.find_by(guid: adv["guid"])
        this_adventure = library.adventures.create(new_adventure)

        adv["pages"].each do |page|
          new_page = {name: page["name"], text: page["text"]}
          this_adventure.pages.create(new_page)
        end
      end
    end

    # @foreign_libraries.each do |lib|
    #   #this is where the recursion happens!
    # end

    redirect_to adventures_path


  end


end