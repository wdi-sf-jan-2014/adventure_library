class Adventure < ActiveRecord::Base
  belongs_to :library
  has_many :pages
  accepts_nested_attributes_for :pages

  before_create :generate_guid

  def generate_guid
    self.guid = SecureRandom.urlsafe_base64(10)
  end

end
