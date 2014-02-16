class LibrariesController < ApplicationController

  include LibrariesHelper

  def index
    @libraries = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => { libraries: @libraries.as_json } }
    end
  end

  def new
    @library = Library.new
  end

  def create
    new_url = params.require(:library).premit(:url)
    scrape(new_url)
    @foreign_libraries.each do |lib|
      if Library.find_by(url: lib["url"]).nil?
      new_lib = Library.create_or_find_by(url: lib["url"])

    end
    resp.each do |x|
      adv = lib.adventures.create(title: x["title"], author: x["author"], guid: x["guid"])
      x["pages"].each do |y|
        adv.pages.create(name: y["name"], text: y["text"])
      end
    end
    redirect_to libraries_path
  end
end
