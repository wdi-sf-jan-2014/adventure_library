class Library < ActiveRecord::Base

  has_many :adventures
  accepts_nested_attributes_for :adventures

  def scrape_adventures
    response = Typhoeus.get(url + "adventures.json")
    if response.response_code > 199 and response.response_code < 400
      result = JSON.parse(response.body)
      adv_scrape = result["adventures"]
    else
      adv_scrape = []
    end
  end

  def scrape_libraries
    response = Typhoeus.get(url + "libraries.json")
    result = JSON.parse(response.body)
    lib_scrape = result["libraries"]
  end

end
