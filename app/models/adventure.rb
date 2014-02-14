class Adventure < ActiveRecord::Base
  belongs_to :library
  has_many :pages
  # before_create guid: SecureRandom.urlsafe_base64(10)
end
