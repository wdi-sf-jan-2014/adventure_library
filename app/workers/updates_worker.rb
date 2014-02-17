class UpdatesWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly.minute_of_hour(18, 30) }

  def perform
    libraries = Library.all
    libraries.each do |library|
      response = Typhoeus.get("#{library.url[0..-2]}"+"/adventures.json")
      unless response.code == 0
        adventures = JSON.parse(response.body) 
        adventures["adventures"].each do |a|
          adv = Adventure.find_or_create_by(guid: a["guid"])
          if !a["updated_at"].nil? && adv.created_at < a["updated_at"]
            adv.update_attributes(:title => a["title"],:author => a["author"])
            unless a["pages"].empty?
              a["pages"].each do |p|
                page = adv.pages.build(:name => p["name"], :text => p["text"])
                page.save
              end
            end
          end
        end
      end
      LibraryWorker.perform_async(library.id)
    end 
  end

end