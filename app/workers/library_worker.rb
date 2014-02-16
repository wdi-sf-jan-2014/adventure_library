class LibraryWorker
  include Sidekiq::Worker

   def perform(library_id)
          library_to_search = Library.find(library_id)
          url = Library.find(library_id).url)
          @friends_adventures = Adventure.where('library_id is not NULL')
          
          #get adventures from this site

          response = Typhoeus.get( url + "/adventures.json")
          result =  JSON.parse(response.body)
          
  
          result["adventures"].each do |adventure|
              adventure_to_add = Adventure.create(adventure)
                
              @friends_adventures << adventure_to_add
              adventure_to_add.library_id = libary_id
              adventure_to_add.save

          end


          #get other libraries from this site
          response = Typhoeus.get(url +"/libraries.json")
          result =  JSON.parse(response.body)
          @libraries = Library.all
          
          if result["libraries"]
          result['libraries'].each do |library|
            if !@libraries.include?(library.url) && (library.url != ' http://sleepy-garden-8077.herokuapp.com')
              Library.create(url:  library.url)
            end
          end
          
   end
end

