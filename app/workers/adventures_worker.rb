class AdventuresWorker
  include Sidekiq::Worker

  def perform(library_id)

    #find the library
    library = Library.find(library_id)

    adv_response = Typhoeus.get("#{library.url}/adventures.json")
    adv_result = JSON.parse(adv_response.body)

    #grab the library's adventures and pages and add it to your own
    adv_result['adventures'].each do |adv| 
      # only create adventures that don't already exist in your library
      if Adventure.where(title: adv["title"]) == []
        new_adv = Adventure.create(title: adv['title'], author: adv['author'], created_at: adv['created_at'], updated_at: adv['updated_at'], guid: adv['guid'])
        adv['pages'].each do |page|
           new_adv.pages.create(name: page['name'], text: page['text'])
        end
      end
    

    end

  end

end
