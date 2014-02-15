class Adventure < ActiveRecord::Base
  has_many :pages
  belongs_to :library

  before_create :create_guid
  
  private

  def create_guid
    if self.guid.nil?
      self.guid = SecureRandom.urlsafe_base64(10)
    end
  end

  def is_local?
    self.library_id.nil?
  end
end
