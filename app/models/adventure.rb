class Adventure < ActiveRecord::Base
  has_many :pages, dependent: :destroy

  # make sure an adventure has a guid, whether created or saved.
  before_create do |adventure| 
    adventure.guid = SecureRandom.urlsafe_base64(10) if adventure.guid.nil?
  end

  before_save do |adventure| 
    adventure.guid = SecureRandom.urlsafe_base64(10) if adventure.guid.nil?
  end

end
