class LinksWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(lib_id)  
    lib = Library.find(lib_id) unless lib_id.nil?

    unless lib.nil?
      domain = get_domain(lib.url)
      puts "Domain: #{domain}"
      
      unless domain.nil?
        lib_json = get_json( domain, "/libraries" )
        new_libs = lib_json["libraries"].nil? ? nil : create_libs( lib_json )

        adv_json = get_json( domain, "/adventures" )
        create_advs( adv_json, lib.id ) unless adv_json["adventures"].nil?
        
        unless new_libs.nil?
          new_libs.each do |l| 
            LinksWorker.perform_async(l.id) unless l.nil? || l.id.nil? || l.url.nil? || l.url.size < 7
          end
        end
      end

    end
  end

  def get_domain(url)
    require 'open-uri'
    
    return nil unless url =~ URI::regexp && url.size > 7
    
    uri = URI.parse(url)
    domain = uri.scheme + '://' + uri.host
    domain += ':' + uri.port.to_s if uri.port != 80 && uri.port != 443
    return domain

  end

  def get_json(url, path="")
    response = Typhoeus.get( url + path + ".json" )
    JSON.parse( response.body ) 

  end

  def create_libs(libs_json)
    require 'open-uri'
    
      libs_json["libraries"].map do |lib| 
        Library.create( url: lib['url'] ) if lib['url'] =~ URI::regexp 
      end

  end

  def create_advs(advs_json, lib_id)
    advs_json["adventures"].each do |adv|

      if adv["guid"].nil? || adv["guid"].size < 6
        new_adv = Adventure.new(  library_id: lib_id, 
                                  title: adv["title"],
                                  author: adv["author"]
                                )
      else
        new_adv = Adventure.new(  library_id: lib_id, 
                                  title: adv["title"],
                                  author: adv["author"],
                                  guid: adv["guid"]
                                )
      end

      if new_adv.save && !adv["pages"].nil?
        adv['pages'].each do |page|
          new_adv.pages.create( name: page["name"],
                                text: page["text"]
                              )
        end
      end
    end

  end

end

