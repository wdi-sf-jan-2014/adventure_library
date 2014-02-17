class HardWorker
  include Sidekiq::Worker




  def perform(url)
    if url[0] == 'h' and url[-1] == '/' #Yup, i know this is not an ideal url validation check
      lib = Library.find_by(url: url)
      if lib == nil
        lib = Library.create(url: url) 
          scraped_advs = lib.scrape_adventures
          if scraped_advs != nil
            scraped_advs.each do |adv|
              if !(Adventure.find_by(guid: adv["guid"]))
                new_adv = lib.adventures.create(title: adv["title"], author: adv["author"], guid: adv["guid"])      
                adv["pages"].each do |page|
                  new_page = new_adv.pages.create(name: page["name"], text: page["text"])      
                end
              end  
            end
          end  

        scraped_libs = lib.scrape_libraries 
        if scraped_libs != nil
          scraped_libs.each do |lib|
            HardWorker.perform_async(lib["url"])
          end
        end  
      end  
    end  
  end 

end
