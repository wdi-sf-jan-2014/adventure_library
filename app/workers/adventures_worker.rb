class AdventuresWorker
  include Sidekiq::Worker


  def perform (url)
    response = JSON.parse(Typhoeus.get(url+"/libraries.json").body)['libraries']
    # unless Library.find_by(url: url)
    #   library = Library.create(url: url)
    # else
    #   library = Library.find_by(url: url)
    # end

    unless Library.find_by(url: url)
      Library.create(url: url)
    end

    get_adventures(url)
    # adventures = JSON.parse(Typhoeus.get(url+"/adventures.json").body)['adventures']
    # adventures.each do |adventure|
    #   library.adventures << Adventure.create(adventure)
    # end

    response.each do |lib|
    perform(lib['url'])
    end
  end


  def get_adventures lib_url
    
    # find library in database
    library = Library.find_by(url: lib_url)
    
    # request JSON info: adventures on server
    response = JSON.parse(Typhoeus.get(lib_url+"/adventures.json").body)['adventures']
    
    # either update adventures to database ...
    response.each do |adv|
      adventure = Adventure.find_by(guid: adv['guid'])
      if adventure
        adventure.update_attributes(title: adv['title'], author: adv['author'])
        
        # add/update pages to database
        adv['pages'].each do |page|
          if Page.find_by(name: page['name'])
            adventure.pages.find_by(name: page['name']).update_attributes(text: page['text'])
          else
            adventure.pages << Page.create(name: page['name'], text: page['text'])
          end
        end

      # ... or add adventures to database
      else
        new_adv = Adventure.create(title: adv['title'], author: adv['author'], guid: adv['guid'])
        library.aventures << new_adv

        # add pages to databasea
        adv['pages'].each do |page|
          new_adv.pages << Page.create(name: page['name'], text: page['text'])
        end
      end
    end

  end

end