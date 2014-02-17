class Library < ActiveRecord::Base

  has_many :adventures
  accepts_nested_attributes_for :adventures

  def scrape_adventures
    response = Typhoeus.get(url + "adventures.json")

    if response.response_code > 199 and response.response_code < 400
      result = JSON.parse(response.body)
      adv_scrape = result["adventures"]
      # if adv_scrape == nil
      #   adv_scrape = []
      # end
    else 
      adv_scrape = []
    end
  end

  def scrape_libraries
    response = Typhoeus.get(url + "libraries.json")

    if response.response_code > 199 and response.response_code < 400
      result = JSON.parse(response.body)
      lib_scrape = result["libraries"]
      # if lib_scrape == nil
      #   lib_scrape = []
      # end
    else
      lib_scrape = []
    end

  end

end
