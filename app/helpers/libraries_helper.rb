module LibrariesHelper

  def scrape(json)
    response = JSON.parse(json.body)
    new_lib = {}
    new_lib[:url] = response.url
    return new_lib
  end

end