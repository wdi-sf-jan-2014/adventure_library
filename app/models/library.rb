class Library < ActiveRecord::Base
  has_many :adventures
  validates :url, uniqueness: { message: "That URL is already in the library", case_sensitive: false }

end
