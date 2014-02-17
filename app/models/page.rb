class Page < ActiveRecord::Base
  belongs_to :adventure
  has_many :pages
end
