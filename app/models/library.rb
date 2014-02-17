class Library < ActiveRecord::Base
  has_many :adventures
  
  before_validation :check_url
  validates :url, uniqueness: { message: "That URL is already in the library", case_sensitive: false }

  def check_url
    url.slice!(-1) if url.slice(-1) == "/"
  end

end
