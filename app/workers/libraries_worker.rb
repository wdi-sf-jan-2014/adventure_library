class LibrariesWorker
  include Sidekiq::Worker

  def perform(adventure_guid)
    require 'open-uri'
    adventure = Adventure.find(adventure_guid)

    contents = Nodogiri::HTML(open(adventure.url))
    #contents.
end