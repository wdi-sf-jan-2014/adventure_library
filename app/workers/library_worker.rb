class LibraryWorker
  include Sidekiq::Worker

   def perform(library_id)
          library_to_search = Library.find(library_id)
          url = Library.find(library_id).url
          @friends_adventures = Adventure.where('library_id is not NULL')
          
          #get adventures from this site

          response = Typhoeus.get( url + "/adventures.json")
          result =  JSON.parse(response.body)
          
  
          result["adventures"].each do |adventure|
              adventure_to_add = Adventure.create(title: adventure['title'], author: adventure['author'], 
                 guid: adventure['guid'], library_id:  library_id)
              adventure["pages"].each do  |page|
                adventure_to_add.pages << Page.create(name: page['name'], text: page['text'])
              end
             @friends_adventures << adventure_to_add
      
          end


          #get other libraries from this site
          response = Typhoeus.get(url +"/libraries.json")
          result =  JSON.parse(response.body)
          @libraries = Library.all
          
          
          if !(result["libraries"]).empty?
            result['libraries'].each do |library|
              my_libraries_with_same_url = Library.where(url: library['url'])
              if   my_libraries_with_same_url.empty? && (library['url'] != 'http://sleepy-garden-8077.herokuapp.com')
                 @libraries << Library.create(url:  library['url'])

              end
            end
          end
          
   end
end

