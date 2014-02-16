# == Schema Information
#
# Table name: libraries
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Library < ActiveRecord::Base
  has_many :adventures, dependent: :destroy

   def self.adventure_to_json(library)
    library.to_json(except: [:id], include: [ adventures: { except: [ :id, :library_id ], include: [ pages: { except: [ :id, :adventure_id ] } ] } ] ) 
  end

  def self.libraries_to_json(libraries)
    { libraries: libraries[1..-1].as_json(except: [:id],  include: [ adventures: { except: [:id, :library_id], include: [pages: {except: [:id, :adventure_id]}] } ] ) } 
  end
  
end