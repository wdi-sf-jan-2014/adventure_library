class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    respond_to do |f|
      f.html {redirect_to '/adventures/'}
      f.json { render :json => {"libraries" => @libraries.as_json(except: :id)} }
    end

  end  

  def new
    @library = Library.new()
  end

  def create
    url = params.require(:library).permit(:url)["url"]
    lib = Library.find_by(url: url)
    if lib != nil
      lib.destroy
    end

    crawl(url)
    redirect_to '/libraries/'
  end

  def crawl(url)
    if url[-1] != '/'
      url += '/'
    end
    if url[0] == 'h'
      lib = Library.find_by(url: url)
      if lib == nil
        lib = Library.create(url: url)
        perform(lib.id)  
      end  
    end    
  end  




  def perform(lib_id)

    lib = Library.find(lib_id)
    if lib.adventures == nil or lib.adventures == []
      scraped_advs = lib.scrape_adventures
      scraped_advs.each do |adv|
        new_adv = lib.adventures.create(title: adv["title"], author: adv["author"], guid: adv["guid"])      
        adv["pages"].each do |page|
          new_page = new_adv.pages.create(name: page["name"], text: page["text"])      
        end
      end
    end
    scraped_libs = lib.scrape_libraries 
    if scraped_libs != nil
      scraped_libs.each do |lib|
        crawl(lib["url"])
      end
    end  
  end 

end
