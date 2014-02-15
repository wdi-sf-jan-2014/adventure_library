class Adventure < ActiveRecord::Base

  has_many :pages, as: :pageable
  belongs_to :library

end
