class LibraryWorker
  include Sidekiq::Worker

   def perform(library_id)
    url = Library.find(library_id).url
          response = Typhoeus.get( url + "/adventures.json")
          result =  JSON.parse(response.body)
          
  
          result["adventures"].each do |adventure|
            library.adventures << Adventure.create(adventure)
          end



          response = Typhoeus.get(url +"/libraries.json")
          result =  JSON.parse(response.body)
          @libraries = Library.all

          result['libraries'].each do |library|
            if !@libraries.include?(library.url) && (library.url != ' http://sleepy-garden-8077.herokuapp.com')
              Library.create(url:  library.url)
            end
          end
          
   end
end

