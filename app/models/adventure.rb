# == Schema Information
#
# Table name: adventures
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  author     :string(255)
#  guid       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  library_id :integer
#

class Adventure < ActiveRecord::Base
  has_many :pages, dependent: :destroy
  belongs_to :library

  # make sure an adventure has a guid, whether created or saved.
  before_create do |adventure| 
    adventure.guid = SecureRandom.urlsafe_base64(10) if adventure.guid.nil?
  end
  before_save do |adventure| 
    adventure.guid = SecureRandom.urlsafe_base64(10) if adventure.guid.nil?
  end

end
