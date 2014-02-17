module LibrariesHelper

  def scrape(url)
    resp1 = Typhoeus.get("#{url}/libraries.json")
    @foreign_libraries = JSON.parse(resp_1.body)["libraries"]

    resp2 = Typhoeus.get("#{url}/adventures.json")
    @foreign_adventures = JSON.parse(resp1.body)["adventures"]
  end

  def url_cleanup(cleanup_url)
    uri = URI.parse(cleanup_url)

    cleanup_url.downcase!

    cleanup_url = ("http://" + cleanup_url) unless uri.scheme

    cleanup_url = cleanup_url.split("/").slice(0,3).join("/")
  end

end