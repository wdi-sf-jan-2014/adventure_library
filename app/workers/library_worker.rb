class LibraryWorker
  include Sidekiq::Worker

   def perform(library_id)
    url = Library.find(library_id).url
          response = Typhoeus.get( url + "/adventures")
          result = response.body
          result['adventures'].each do |adventure|
              library_to_search.adventures << Adventure.create(adventure)
          end

          response = Typhoeus.get(url +"/libraries")
          result = response.body
          @libraries = Library.all
          result['libraries'].each do |library|
            if !@libraries.include?(library.url)
              Library.create(url:  library.url)
            end
          end
          
   end
end

