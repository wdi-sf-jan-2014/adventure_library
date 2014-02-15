class AdventuresWorker
  include Sidekiq::Worker

  def perform(library_id)
    library = Library.find(library_id)
    adv_response = Typhoeus.get("http://#{library.url}/adventures.json")
    adv_result = JSON.parse(adv_response.body)
    
    adv_result["adventures"].each do |adventure|
      if @library.adventures.where("guid != ?", adventure["guid"]) != nil
        adv = library.adventures.create(title: adventure["title"], author: adventure["author"], guid: adventure["guid"])
      
        adventure["pages"].each do |page|
          adv.pages.create(name: page["name"], text: page["text"])
        end
      end
    end

  end
end