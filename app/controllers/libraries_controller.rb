class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    respond_to do |format|
      format.html
      format.json { render json: { libraries: @libraries.as_json(only: [:url]) }, status: :ok }
    end
  end

  def show
  end

  def scrape(url)
    response_html = Typhoeus.get(url)
    if response_html.response_code == 200 # also, check for uniqueness here 
      response_json = JSON.parse(response_html.body)
      response_json["libraries"].each do |library|
        if Typhoeus.get(library["url"] + "libraries.json").response_code == 200
          Library.create(library) # check for uniqueness here?
          scrape(library)
        end
      end
    end
  end

end