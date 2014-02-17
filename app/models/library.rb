class Library < ActiveRecord::Base
  has_many :adventures, dependent: :destroy
end
