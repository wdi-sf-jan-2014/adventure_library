class Adventure < ActiveRecord::Base
  has_many :pages
  belongs_to :library

def start
  Page.find_by(adventure_id: id, name: "Start")
end

end
