class LibrariesWorker
  include Sidekiq::Worker

  def perform(library_id)
    library = Library.find(library_id)
    lib_link = library.url

  #to get library listing
    if (lib_link.ends_with? '/')
      lib_link = lib_link.concat('libraries.json')
    end
    if (lib_link.ends_with? 's')
      lib_link = lib_link.concat('/libraries.json')
    end

  #save new libraries
    response = Typhoeus.get(lib_link)
    new_libraries = JSON.parse(response.body)["libraries"]
    for i in new_libraries
      if Library.find_by(url: i["url"]) == nil
        Library.create(url: i["url"])
      end
    end
binding.pry


  #to get that library's local adventures
    if (lib_link.ends_with? '/')
    	adv_link = lib_link.concat('adventures.json')
    end
    if (lib_link.ends_with? 's')
    	adv_link = lib_link.concat('/adventures.json')
    end
  binding.pry

  #save new adventures
    adv_response = Typhoeus.get(adv_link)
    binding.pry
    adv_result = JSON.parse(adv_response.body)["adventures"]
  binding.pry
  #new local vars for json values
    for adv in adv_result
      guid = adv["guid"]
      title = adv["title"]
      author = adv["author"]
      pages = adv["pages"]
      if Adventure.find_by(guid: guid)
        new_adv = Adventure.create(title: title, author: author, guid: guid)
        for p in pages
        new_adv.pages << Page.create(name: p["name"], text: p["text"])
        end
      end
    end

  end
end