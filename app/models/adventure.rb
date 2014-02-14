class Adventure < ActiveRecord::Base
has_many :pages
belongs_to :library

accepts_nested_attributes_for :pages

# before_save :add_guid

def start
  Page.find_by(adventure_id: id, name: "start")
end

# private

# def add_guid
#   guid = 
# end

end
