# == Schema Information
#
# Table name: adventures
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  author     :string(255)
#  library_id :integer
#  created_at :datetime
#  updated_at :datetime
#  guid       :string(255)
#

class Adventure < ActiveRecord::Base
  belongs_to :library
  has_many :pages

  #before_create: randomize string & attach it to instance

  def self.gen_random_str

    SecureRandom.urlsafe_base64(10)
 
  #insert secure string in column
  #relate string to ID & backwards
  end

end
