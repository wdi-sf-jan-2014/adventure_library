class Library < ActiveRecord::Base
    has_many :adventures, :dependant => :destroy
end
