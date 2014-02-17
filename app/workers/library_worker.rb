class LibraryWorker
  include Sidekiq::Worker
  require 'sidekiq'

  def perform(library)
    url = library["url"]
    Library.find_by(url: url)
    response = Typhoeus.get(url + "adventures.json")
    result = JSON.parse(response.body)
    library = Library.create(url: url)
    add_pages(library, result["adventures"])
  end

  def add_pages(library, adventures)
    adventures.each do |adventure|
    new_adventure = library.adventures.create(title: adventure["title"], author: adventure["author"], guid: adventure["guid"])
          adventure["pages"].each do |page|
          new_adventure.pages.create(name: page["name"], text: page["text"] )
      end
    end
  end
end