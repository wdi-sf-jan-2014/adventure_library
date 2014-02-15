# == Schema Information
#
# Table name: adventures
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  author     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  guid       :string(255)
#

class Adventure < ActiveRecord::Base
  has_many :pages, dependent: :destroy
  accepts_nested_attributes_for :pages
end