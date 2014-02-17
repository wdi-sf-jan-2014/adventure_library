class LibrariesWorker
  include Sidekiq::Worker

  def perform(url)
    require 'open-uri'

    if Library.find_by(url: url).nil?
      Library.create(url: url)
      response = Typhoeus.get(url, params: "adventures.json")
      result = JSON.parse(response)
      result.each do |adveture| 
        if Adventure.find_by(guid: adventure["guid"])nil?
          adv = Adventure.create(
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
      get_other_library_urls(url)
    end

  private

  def get_other_library_urls(url)
    response = Typhoeus.get(url, params: "libraries.json")
    result = JSON.parse(response)
    result.each do |library|
      LibrariesWorker.perform_async(library)
    end
  end
end


call the LibrariesWorker in this method for each url and then do typhouse get
  and then parse the resposne to get the title and text and creaete a new page 
  for that new adventure