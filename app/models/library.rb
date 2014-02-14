class Library < ActiveRecord::Base
  has_many :adventures

  before_create :create_guid

  private

  def create_guid
    self.guid = SecureRandom.urlsafe_base64(10)
  end
end
