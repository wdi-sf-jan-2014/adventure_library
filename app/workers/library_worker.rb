class LibraryWorker
  include Sidekiq::Worker

  def perform (library_id)
    library = Library.find_by(id: library_id)
    adv_response = Typhoeus.get("#{library.url}"+"/adventures.json")
    unless adv_response.code == 0
      adventure_hash = JSON.parse(adv_response.body)
      adventure_hash["adventures"].each do |a|
        if Adventure.find_by(guid: a["guid"])
          next
        else
          adventure = library.adventures.build(:title => a["title"], :author => a["author"], :guid => a["guid"])
          if adventure.save && !a["pages"].empty? && !a["pages"].include?(:title => "start")
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
