class LibrariesWorker
  include Sidekiq::Worker

  def perform(library_id)
#     @library = Library.find(library_id)
    
#     if @library.url.start_with?("http://")
#       url = @library.url + "/libraries.json"
#     else
#       url = "http://" + @library.url + "/libraries.json"
#     end

#     response = Typhoeus.get(url)

#       if response != []
#       result = JSON.parse(response.body)
      
#       result["libraries"].each do |library|
#         if Library.where(url: library["url"]) == []
#           Library.create(url: library["url"])
#         end
#       end  
#       end

#   end
# end

###

   new_library = Library.find(library_id)

   url = new_library.url
    response = Typhoeus.get("#{url}/libraries.json")
    result = JSON.parse(response.body)
      result["libraries"].each do |f|
        l_url= f["url"]
          if Library.where(url: l_url).exists?
          else
            new_lib = Library.create(url: l_url)
            adv_response = Typhoeus.get("#{l_url}/adventures.json")
            adv_result = JSON.parse(adv_response.body)
              adv_result["adventures"].each do |y|
                title = y["title"]
                author = y["author"]
                guid = y["guid"]
                updated=y["updated_at"]
                if Adventure.where(guid: guid).exists?
                else
                new_adventure = Adventure.create(title: title, author: author, guid: guid, updated_at: updated, library_id: new_lib.id )
                  y["pages"].each do |m|
                    new_adventure.pages.create(name: m["name"], text: m["text"])
                  end
                end
              end

          end
      end

  end


