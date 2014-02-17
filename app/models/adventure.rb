# == Schema Information
#
# Table name: adventures
#
#  id         :integer          not null, primary key
#  library_id :integer
#  title      :string(255)
#  author     :string(255)
#  GUID       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Adventure < ActiveRecord::Base
  has_many :pages
  belongs_to :library
  accepts_nested_attributes_for :pages

  def self.is_local?
    adventure.library_id.nil?
  end
end
