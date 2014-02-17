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

  def scrape_libraries(library_url)
    response = Typhoeus.get(library_url+'/libraries.json')
    libraries_result_hash = JSON.parse(response.body)["libraries"]
    puts("a library url: " + libraries_result_hash[0]["url"])
  end

end
