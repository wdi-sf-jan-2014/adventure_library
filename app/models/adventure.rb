class Adventure < ActiveRecord::Base
	has_many :pages
	accepts_nested_attributes_for :pages
	belongs_to :library
end
