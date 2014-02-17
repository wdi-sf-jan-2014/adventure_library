class AdventuresWorker
  include Sidekiq::Worker


  def perform (url)
    request = "#{url}/libraries.json"
    response = JSON.parse(Typhoeus.get(request).body)['libraries']

    response.each do |lib|
      Library.create(url: lib['url']) unless Library.find_by(url: lib['url'])
      get_adventures(lib['url'])
      perform(lib['url'])
    end
  end


  def get_adventures lib_url
    
    # find library in database
    library = Library.find_by(url: lib_url)

    # request JSON info: adventures on server
    request = "#{lib_url}/adventures.json"
    response = JSON.parse(Typhoeus.get(request).body)['adventures']
    
    response.each do |adv|
      
      # either update adventures to database ...
      # if Adventure.find_by(guid: adv['guid'])
      #   adventure = Adventure.find_by(guid: adv['guid'])
      #   adventure.update_attributes(title: adv['title'], author: adv['author'])
        
      #   # add/update pages to database
      #   adv['pages'].each do |page|
      #     if Page.find_by(name: page['name'])
      #       adventure.pages.find_by(name: page['name']).update_attributes(text: page['text'])
      #     else
      #       adventure.pages << Page.create!(name: page['name'], text: page['text'])
      #     end
      #   end

      # # ... or add adventures to database
      # else
        unless Adventure.find_by(guid: adv['guid'])
        new_adv = library.adventures.build(:title => adv['title'], :author => adv['author'], :guid => adv['guid'])
        new_adv.save

        # add pages to databasea
        adv['pages'].each do |page|
          new_page = new_adv.pages.build(:name => page['name'], :text => page['text'])
          new_page.save
        end
      end
    end

  end

end