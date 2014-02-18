class Library < ActiveRecord::Base
  #self.include_root_in_json = true
  has_many :adventures
end
