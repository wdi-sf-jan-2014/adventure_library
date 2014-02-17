class UpdatesWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly.minute_of_hour(7, 14, 28, 35, 42, 49, 56) }

  def perform
    libraries = Library.all
    for_worker = []
    libraries.each do |library|
      response = Typhoeus.get("#{library.url[0..-2]}"+"/adventures.json")
      if response.code == 0
        next
      else
        adventures = JSON.parse(response.body) 
        adventures["adventures"].each do |a|
          if Adventure.find_by(guid: a["guid"]) && (Adventure.find_by(guid: a["guid"]))["created_at"] < a["updated_at"]
            adv = Adventure.find_by(guid: a["guid"])
            adv.update_attributes(:title => a["title"],:author => a["author"])
          elsif !Adventure.find_by(guid: a["guid"])
            new_a = library.adventures.build(:title => a["title"], :author => a["author"], :guid => a["guid"])
            if new_a.save
              a["pages"].each do |p|
                page = adventure.pages.build(:name => p["name"], :text => p["text"])
                page.save
              end
            end
          end
        end
        for_worker << { "url" => library.url[0..-2]}
      end
    end
    LibraryWorker.perform_async(for_worker)
  end

end