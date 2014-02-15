class Adventure < ActiveRecord::Base
  belongs_to :library
  has_many :pages, :dependent => :destroy
  accepts_nested_attributes_for :pages
end
