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
  has_many :adventures
  accepts_nested_attributes_for :adventures

  # before_save {|library| library.url = library.url_cleanup}

  def listed?(url)
    find_by(url: url)
  end
end
