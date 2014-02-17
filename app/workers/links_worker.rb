class LinksWorker 
  include Sidekiq::Worker 

  def perform(library_id)
  
    library = Library.find(library_id)
    clean_url = library.url 

    # start with library listings 
    if(clean_url.ends_with? '/')
      library_link = clean_url + 'libraries.json'
    end
    # not sure this is nesc
    if (clean_url.ends_with? 's')
      library_link = clean_url + '/libraries.json'
    end 

    # save the new libraries here 
    response = Typhoeus.get(library_link)
    new_libraries = JSON.parse(response.body)['libraries']
    for i in new_libraries
      if Library.find_by(url: i["url"]) == nil
        Library.create(url: i["url"])
      end 
    end 

    # retrieve the new adventures 
    library = Library.find(library_id)
    l_link = library.url
    if (l_link.ends_with? '/')
      adv_link = l_link + 'adventures.json'
    end 
    if (l_link.ends_with? 's')
      adv_link = l_link + '/adventures.json'
    end 

    # save new adventures
    adv_response = Typhoeus.get(adv_link)
    adv_result = JSON.parse(adv_response.body)["adventures"]
    #  local variables for json values 
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


