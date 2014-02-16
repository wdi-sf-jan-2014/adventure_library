# == Schema Information
#
# Table name: pages
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  text         :text
#  created_at   :datetime
#  updated_at   :datetime
#  adventure_id :integer
#

class Page < ActiveRecord::Base
  belongs_to :adventure 
end
