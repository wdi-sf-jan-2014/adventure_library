class Adventure < ActiveRecord::Base
  has_many :pages
  belongs_to :library

  def is_local? adventure
    adventure.library_id.nil?
  end
end
