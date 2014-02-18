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
  validates :url, uniqueness: true
end
