# == Schema Information
#
# Table name: libraries
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Library < ActiveRecord::Base
  has_many :adventures, dependent: :destroy

  # get the json list of libraries from this library
  def scrape_libraries(url=self.url)
    response = Typhoeus.get(url + '/libraries.json')
    
    # if get a good reponse back, parse the JSON, else return empty
    libraries_result_hash = {}
    if response.code == 200 && !response.body.empty?
      libraries_result_hash = JSON.parse(response.body)["libraries"]
    end

    return libraries_result_hash
  end

  # get the json list of adventures from this library
  def scrape_adventures(url=self.url)
    response = Typhoeus.get(url + "/adventures.json")

    # if get a good reponse back, parse the JSON, else return empty
    adventures_result_hash = {}
    if response.code == 200 && !response.body.empty?
      adventures_result_hash = JSON.parse(response.body)["adventures"]
    end
  
    return adventures_result_hash
  end

end
