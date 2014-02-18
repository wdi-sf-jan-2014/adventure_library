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

  def add_adventures(adventures_list)

    adventures_list.each do |adventure|

      # add adventures you do not already have (prevent self scraping), and have pages
      if Adventure.find_by(guid: adventure["guid"]).nil? && !adventure["pages"].nil? && adventure_has_start(adventure["pages"])

        # could potentially use from_json here, if you trusted the json you scraped.
        curr_adv = self.adventures.create(:title => adventure["title"],
                                        :author => adventure["author"],
                                        :guid => adventure["guid"])
        # store each page of the adventure
        adventure["pages"].each do |page|
          curr_adv.pages.create(:name => page["name"], :text => page["text"])
        end
      end
    end
  end

private

  def adventure_has_start(pages)
    pages.each { |page| return true if page.has_value?("start") }
    return false
  end


end
