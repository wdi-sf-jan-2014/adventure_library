class Library < ActiveRecord::Base

  has_many :adventures, as: :adventurable

end
