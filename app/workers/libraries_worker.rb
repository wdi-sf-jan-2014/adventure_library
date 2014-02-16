class LibrariesWorker
  include Sidekiq::Worker

  def perform(library_id)
    library = Library.find(library_id)
    
    if library.url.start_with?("http://")
      url = library.url + "/libraries.json"
    else
      url = "http://" + library.url + "/libraries.json"
    end

    response = Typhoeus.get(url)
    result = JSON.parse(response.body)

      if result["libraries"].length > 1
        result["libraries"].each do |library|
          Library.create(url: library["url"])
        end
      end
      
  end
end


