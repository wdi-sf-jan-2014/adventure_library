class LibrariesController < ApplicationController
  include LibrariesHelper

  def index
    @libraries = Library.all

    respond_to do |format|
      format.html
      format.json { render json: { libraries: @libraries.as_json } }
    end
  end

  def new
    @library = Library.new
  end

  def create
    new_library = params.require(:library).permit(:url)
    scrape(new_library[:url])

    library = Library.create(new_library)

    @foreign_adventures.each do |adv|
      new_adventure = {title: adv["title"], author: adv["author"], guid: adv["guid"]}
      this_adventure = library.adventures.create(new_adventure)

      adv["pages"].each do |page|
        new_page = {name: page["name"], text: page["text"]}
        this_adventure.pages.create(new_page)
      end
    end

    @foreign_libraries.each do |lib|
      #implent
    end

    redirect_to adventures_path


  end


end