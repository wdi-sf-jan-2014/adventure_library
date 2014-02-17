class AdventuresWorker
  include Sidekiq::Worker

  def get_adventures library_id
    library = Library.find(library_id)
    if library
      request = library.url+"/adventures.json"
      response = JSON.parse(Typhoeus.get(request).body)
      response['adventures'].each do |adventure|
        adventure_in_library = Adventure.find_by(guid: adventure.guid)
        if adventure_in_library
          adventure_in_library.update_attributes(adventure)
        else
          library.adventures << Adventure.create(adventure)
        end
      end
    end
  end


end