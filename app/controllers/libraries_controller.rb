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

  def scrape_libraries(url)
    response_html = Typhoeus.get(url + "libraries.json")
    if response_html.response_code == 200
      response_json = JSON.parse(response_html.body)
      response_json["libraries"].uniq do |library|
        if library["url"][0..4] == "https"
          library["url"].tr!('s','')
        end
        if Typhoeus.get(library["url"] + "libraries.json").response_code == 200 && !library.has_key?("name") && Library.new(library).valid? 
          found = Library.create(library)
              #scrape_libraries(found["url"])
        end
      end
    end
  end

end