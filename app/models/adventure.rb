class Adventure < ActiveRecord::Base
  has_many :pages
  belongs_to :library

  before_create :create_guid
 
  def is_local?
    self.library_id.nil?
  end
   
  private

  def create_guid
    if self.guid.nil?
      self.guid = SecureRandom.urlsafe_base64(10)
    end
  end
end
