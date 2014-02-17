class LibrariesWorker
  include Sidekiq::Worker

  def perform(library_id)
    library = Library.find(library_id)
    lib_link = library.url

  #to get library listing
    if (lib_link.ends_with? '/')
      library_link = lib_link + 'libraries.json'
    end
    if (lib_link.ends_with? 's')
      library_link = lib_link + '/libraries.json'
    end

  #save new libraries
    response = Typhoeus.get(library_link)
    new_libraries = JSON.parse(response.body)["libraries"]
    for i in new_libraries
      if Library.find_by(url: i["url"]) == nil
        Library.create(url: i["url"])
      end
    end


  #to get that library's local adventures
    l_link = library.url
    if (l_link.ends_with? '/')
    	adv_link = l_link + 'adventures.json'
    end
    if (l_link.ends_with? 's')
    	adv_link = l_link + '/adventures.json'
    end

  #save new adventures
    adv_response = Typhoeus.get(adv_link)
    adv_result = JSON.parse(adv_response.body)["adventures"]
  #new local vars for json values
    for adv in adv_result
      guid = adv["guid"]
      title = adv["title"]
      author = adv["author"]
      pages = adv["pages"]
      if Adventure.find_by(guid: guid) == nil
        new_adv = Adventure.create(title: title, author: author, guid: guid)
        pages.each do |p|
          new_adv.pages << Page.create(name: p["name"], text: p["text"])
        end
      end
    end

  end
end