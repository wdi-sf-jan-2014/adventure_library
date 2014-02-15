Class LinksWorker 
  include Sidekiq::Worker

  def perform(lib_id)
    lib = Library.find(lib_id)

    if lib
      domain = get_domain(lib.url)

      lib_json = get_json(domain, "/libraries")
      new_libs = create_libs(lib_json)
      
      adv_json = get_json(domain, "/adventures")
      create_advs(adv_json, lib.id)

      new_libs.each { |lib| perform(lib.id) }

    end

  end

  def get_domain(url)
      require 'open-uri'
      uri = URI.parse(library.url)
      domain = uri.scheme + '://' + uri.host
      domain += ':' + uri.port.to_s if uri.port != 80 && uri.port != 443

  end

  def get_json(url, path)
    response = Typhoeus.get(url + ".json")
    JSON.parse(response.body) 

  end

  def create_libs(libs_json)
    
    libs_json.map { |lib| Library.create( url: lib['url'] ) }

  end

  def create_advs(advs_json, lib_id)
    advs_json.each do |adv|
      new_adv = Adventure.new(  library_id: lib_id, 
                                title: adv.title,
                                author: adv.author,
                                guid: adv.guid )
      if new_adv.save
        adv['pages'].each do |page|
          new_adv.pages.create( name: page.name,
                                text: page.text
                                )
        end
      end

    end

  end

  
