class LibraryWorker
  include Sidekiq::LibraryWorker
   library
   def perform(library_id)
          response = Typhoeus.get(link_href + "/adventures")
          result = response.body
          result['adventures'].each do |adventure|
              library_to_search.adventures << Adventure.create(adventure)
          end

          response = Typhoeus.get(link-href+"/libraries")
          result = response.body
          @libraries = Library.all
          result['libraries'].each do |library|
            if !@libraries.include?(library.url)
              Library.create(url:  library.url)
            end
          end
          
end
end

