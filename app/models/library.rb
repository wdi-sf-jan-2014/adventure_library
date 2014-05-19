class Library < ActiveRecord::Base
  has_many :adventures

  validates :url, presence: true, uniqueness: true
end
