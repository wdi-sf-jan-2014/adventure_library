class LibraryWorkers
  include Sidekiq::Worker

  def perform(library_id)
    library = Library.find(library_id)
    adv_response = Typhoeus.get("http://#{library.url}/libraries.json")
    adv_result = JSON.parse(adv_response.body)
    
    adv_result["libraries"].each do |library|
      unless Library.where(url: library["url"])
        Library.create(url: library["url"])
      end
    end    
  end
end