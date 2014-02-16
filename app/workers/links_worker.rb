class LinksWorker
  include Sidekiq::Worker

  def perform(library_id)
    library = Library.find(library_id)
    # response = Typhoeus.get("#{@library.url}adventures.json")  
  end
end