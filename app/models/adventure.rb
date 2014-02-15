class Adventure < ActiveRecord::Base
has_many :pages
belongs_to :library

accepts_nested_attributes_for :pages
validates :guid, uniqueness: { message: "This adventure is already recorded." }

def start
  Page.find_by(adventure_id: id, name: "start")
end

end