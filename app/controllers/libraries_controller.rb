
class LibrariesController < ApplicationController
  def index
    # retrieve a list of external libraries
    libraries = Library.all

    # add our local library to the list, since it's not in the database
    libraries.push(url: '/adventures')

    # build a JSON root of the libraries array
    lib_root = Hash['libraries', libraries.as_json()]

    # convert the hash into JSON form and return
    render :json => lib_root
  end

  def create
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

    host_url = params[:library][:url]
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

    redirect_to adventures_path
  end
end
