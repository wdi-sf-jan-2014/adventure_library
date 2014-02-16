class LinksWorker
  include Sidekiq::Worker
  def perform(library_id)

#get the other library links from json
    library = library.find(library_id)
    link = library.url + "/libraries.json"
    response = Typhoeus.get(link)
    new_libraries_array = JSON.parse(response.body)["libraries"]
    	for i in new_libraries_array
    		Library.create(url: i["url"])
    		#now pull the adventures from these new urls if I dont have then already
    		ad_link = i['url'] + "/adventures.json"
            ad_response = Typhoeus.get(ad_link)
            new_adventures_array = JSON.parse(ad_response.body)["adventures"]
            for a in new_adventures_array
	       		title = i["title"]
	       		author = i["author"]
	       		guid = i["guid"]
	       		pages = i["pages"]
	       		new_adv = Adventure.create(title: title, author: author, guid: guid)
	       			for p in pages
	       				new_adv.pages << Page.create(name: p["name"], text: p["text"])
	       			end

	        end

    	end

    #get the adventure json first from the library link, then from the rest
    ad_link = library.url + "/adventures.json"
    ad_response = Typhoeus.get(ad_link)
    new_adventures_array = JSON.parse(ad_response.body)["adventures"]
       for a in new_adventures_array
       		title = i["title"]
       		author = i["author"]
       		guid = i["guid"]
       		pages = i["pages"]
       		new_adv = Adventure.create(title: title, author: author, guid: guid)
       			for p in pages
       				new_adv.pages << Page.create(name: p["name"], text: p["text"])
       			end

       end

  end #method
  
end #class
