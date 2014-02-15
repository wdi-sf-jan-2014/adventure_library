class Adventure < ActiveRecord::Base
  belongs_to :library
  has_many :pages, dependent: :destroy
  accepts_nested_attributes_for :pages, allow_destroy: true

  def self.find_local_adventures adventures
  	local_adventures = adventures.where(:library_id => nil)
  	local_adventures.to_json(only: [:title, :author, :guid], include: [ {pages: {only: [:name, :text]}}])
  end

end
