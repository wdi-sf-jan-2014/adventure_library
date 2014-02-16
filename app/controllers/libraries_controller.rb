class LibrariesController < ApplicationController

  include LibrariesHelper

  def new
    @library = Library.new
  end

  def index
    @library = Library.all
    respond_to do |f|
      f.html
      f.json { render :json => { libraries: @libraries.as_json } }
    end
  end

  def create
    lib = Library.create(url: params[:library][:url])
    new_adv = Typhoeus.get(params[:library][:url])
    resp = JSON.parse(new_adv.body)["adventures"]
    resp.each do |x|
      adv = lib.adventures.create(title: x["title"], author: x["author"], guid: x["guid"])
      x["pages"].each do |y|
        adv.pages.create(name: y["name"], text: y["text"])
      end
    end
    redirect_to libraries_path
  end
end
