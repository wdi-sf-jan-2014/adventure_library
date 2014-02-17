class LibrariesWorker
  include Sidekiq::Worker
  require 'sidekiq'

  def perform(url)

    if Library.find_by(url: url).nil?
      lib = Library.create(url: url)
      json = url + "/adventures.json"
      response = Typhoeus.get(json)
      result = JSON.parse(response.body)
      result["adventures"].each do |adventure| 
        if Adventure.find_by(guid: adventure["guid"]).nil?
          adv = lib.adventures.create(
          title: adventure["title"],
          author: adventure["author"],
          guid: adventure["guid"]
          )
          adventure['pages'].each do |page|
            adv.pages.create(
              name: page["name"], 
              text: page["text"]
              )
          end
        end
      end
    end
    get_other_library_urls(url)
  end

  private

  def get_other_library_urls(url)
    json = url + "/libraries.json"
    response = Typhoeus.get(json)
    result = JSON.parse(response.body)
    result["libraries"].each do |library|
      LibrariesWorker.perform_async(library["url"])
    end
  end
end
