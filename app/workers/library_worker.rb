class LibraryWorker
  include Sidekiq::LibraryWorker

   def perform(library_id)
    require 'open-uri'
     library_to_search = Library.find(library_id)

     if(library_to_search)
       uri = url.parse(library_to_search.url)


       domain = uri.scheme + '://' + uri.host
      domain += ':' + uri.port.to_s if uri.port != 80 && uri.port != 443

      contents = Nokogiri::HTML(open(library_to_search.url))
      contents.css('a').each do |link|
        link_href = link.attributes['href'].value
        if (link_href.starts_with? '/')
          link_href = domain + link_href
        end

        if (link_href.starts_with? 'http://', 'https://')
          response = Typhoeus.get(link_href)

          library_to_search.links.create(url: link_href, http_response: response.response_code)
        end  
      end
    end
  end
end
