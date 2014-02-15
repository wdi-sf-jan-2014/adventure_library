class AdventuresWorker
  include Sidekiq::Worker

  def perform(library_id)
    library = Library.find(library_id)
    adv_response = Typhoeus.get("http://#{library.url}/adventures.json")
    adv_result = JSON.parse(adv_response.body)
    
    adv_result["adventures"].each do |adventure|
      # unless @library.adventures.where(guid: adventure["guid"])
      library.adventures.create(title: adventure["title"], author: adventure["author"], guid: adventure["guid"])
      # end
    end
  end
end