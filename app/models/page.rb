class Page < ActiveRecord::Base
  include PagesHelper
  belongs_to :adventure

end
