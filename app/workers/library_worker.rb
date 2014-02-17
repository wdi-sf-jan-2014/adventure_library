class LibraryWorker
  include Sidekiq::Worker

  def perform (libraries)
    libraries.each do |l|
      library = Library.find_or_create_by(url: l["url"])
        adv_response = Typhoeus.get("#{library.url}"+"/adventures.json")
        if adv_response.code == 0
          next
        else
          adventure_hash = JSON.parse(adv_response.body)
          adventure_hash["adventures"].each do |a|
            if Adventure.find_by(guid: a["guid"])
              next
            else
              adventure = library.adventures.build(:title => a["title"], :author => a["author"], :guid => a["guid"])
              if adventure.save
                a["pages"].each do |p|
                  page = adventure.pages.build(:name => p["name"], :text => p["text"])
                  page.save
                end
              end
            end
          end
        end
        
    end
  end
end
