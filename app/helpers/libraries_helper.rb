module LibrariesHelper
  def scrape(url)
    adventures = Typhoeus.get("#{url}/adventures.json")
    @foreign_adventures = JSON.parse(adventures.body)["adventures"]

    libraries = Typhoeus.get("#{url}/libraries.json")
    @foreign_libraries = JSON.parse(adventures.body)["libraries"]
  end
end