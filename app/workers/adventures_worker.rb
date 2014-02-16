class AdventuresWorker
  include Sidekiq::Worker

  def perform(library_id)
    library = Library.find(library_id)

      if library.url.start_with?("http://")
      url = library.url + "/adventures.json"
    else
      url = "http://" + library.url + "/adventures.json"
    end

    response = Typhoeus.get(url)

    result = JSON.parse(response.body)

    result["adventures"].each do |adventure|
      if library.adventures.where(title: adventure["title"]) == []

      adv = library.adventures.create(title: adventure["title"], 
                      author: adventure["author"], guid: adventure["guid"])

      adventure["pages"].each do |page|
        adv.pages.create(name: page["name"], text: page["text"])
      end
      end
    end

  end

end