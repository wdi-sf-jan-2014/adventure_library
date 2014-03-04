class Adventure < ActiveRecord::Base
  belongs_to :library
  has_many :pages
  accepts_nested_attributes_for :pages
  after_initialize do
    if self.new_record?
    self.guid = SecureRandom.urlsafe_base64(10) 
    end
  end
end
