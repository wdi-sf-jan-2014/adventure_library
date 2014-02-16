class Library < ActiveRecord::Base

  has_many :adventures
  accepts_nested_attributes_for :adventures

  def scrape_adventures
    response = Typhoeus.get(url + "adventures.json")
    result = JSON.parse(response.body)
    result["adventures"].each do |adv|
        new_adv = self.adventures.create(title: adv["title"], author: adv["author"], guid: adv["guid"])      
        adv["pages"].each do |page|
          new_page = new_adv.pages.create(name: page["name"], text: page["text"])      
        end
    end     
  end

  def scrape_libraries
    response = Typhoeus.get(url + "libraries.json")
    result = JSON.parse(response.body)
    binding.pry
    result["libraries"].each do |lib|
      if Url.find_by_url(lib["url"]) != nil
        lib = Library.create(url: url)
      end
    end  
  end

end
