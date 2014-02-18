class AdventuresWorker
  include Sidekiq::Worker


  def perform (url)
    if url.ends_with? '/'
      request = "#{url}libraries.json"
    else
      request = "#{url}/libraries.json"
    end
    response = JSON.parse(Typhoeus.get(request).body)

    # for each library url in libraries hash
    response['libraries'].each do |lib|
      next if lib['url'] == '/adventures'

      # add library to database if not already
      Library.create!(url: lib['url']) unless Library.find_by(url: lib['url'])
      #check response code

      # find library in database
      library = Library.find_by(url: lib['url'])

      # request JSON info: adventures on server
      if lib['url'].ends_with? '/'
        request = "#{library['url']}adventures.json"
      else
        request = "#{library['url']}/adventures.json"
      end
      response = JSON.parse(Typhoeus.get(request).body)
      
      unless response.nil?
        response['adventures'].each do |adv|
          unless Adventure.find_by(guid: adv['guid'])
            new_adv = library.adventures.create!(:title => adv['title'], :author => adv['author'], :guid => adv['guid'])
            new_adv.save

            # add pages to databasea
            adv['pages'].each do |page|
              new_page = new_adv.pages.create!(:name => page['name'], :text => page['text'])
              new_page.save
            end
          end
        end
      end

      AdventuresWorker.perform_async(lib['url'])

    end

  end


end