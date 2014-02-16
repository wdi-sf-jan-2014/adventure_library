class Adventure < ActiveRecord::Base
    has_many :pages
    belongs_to :library
      # def is_local? 
      #   if library_id nil?
      #     local
      # end
    accepts_nested_attributes_for :pages
end 
