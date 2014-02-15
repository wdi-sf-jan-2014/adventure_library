class Adventure < ActiveRecord::Base
  has_many :pages, dependent: :destroy
  belongs_to :library
end
