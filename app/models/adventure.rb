class Adventure < ActiveRecord::Base
  has_many :pages, dependent: :destroy
  belongs_to :library
  accepts_nested_attributes_for :pages

#  here are making sure that when I scrape other libraries 
#  their adventures are not linked to mine because my adventures 
#  are linked to my library by guid...yes? 
  def self.is_local?
    adventure.library_id.nil?
  end 
end
