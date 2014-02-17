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

  def scrape_libraries
    response = Typhoeus.get(self.url+'/libraries.json')
    libraries_result_hash = JSON.parse(response.body)["libraries"]
    return libraries_result_hash
  end

end
