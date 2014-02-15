# == Schema Information
#
# Table name: pages
#
#  id           :integer          not null, primary key
#  adventure_id :integer
#  name         :string(255)
#  text         :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Page < ActiveRecord::Base
  belongs_to :adventure

end
