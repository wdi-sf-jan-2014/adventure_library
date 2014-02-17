class ScrapeWorker
  include Sidekiq::Worker

  def fetch_adventures(library)
    host_url = library.url
    begin
      response = Typhoeus.get(host_url + '/adventures.json')
      print "Fetching " + host_url + '/adventures.json'
      adventures = JSON.parse(response.body)['adventures']

    rescue JSON::ParserError => err
      puts "There was a Parser Error #{err}"
      return

    end

    adventures.each do |adv|
      # print adv.to_json
      Adventure.destroy_all(:guid => adv['guid'])

      adv.delete('id')
      pages = adv.delete('pages') || [] # remove 'pages' value from JSON hash and assign it to pages local variable; use empty array if 'pages' value does not exist
      adventure = Adventure.new.from_json(adv.to_json)

      adventure.pages = []
      pages.each do |page|
        page.delete('id')
        adventure.pages.push(Page.new.from_json(page.to_json))
      end

      adventure.library = library
      adventure.save
    end
  end

  def perform(host_url)
    begin
      response = Typhoeus.get(host_url + '/libraries')
      libraries = JSON.parse(response.body)['libraries']

      libraries.each do |lib|
        library_url = lib['url']
        if not library_url.start_with? '/adventures'
          library = Library.new
          library.url = library_url
          fetch_adventures(library)
          library.save
        end
      end

      library = Library.new
      library.url = host_url
      fetch_adventures(library)
      library.save
    rescue JSON::ParserError => err
      puts "There was a Parser Error #{err}"
      return
    end
  end

end

