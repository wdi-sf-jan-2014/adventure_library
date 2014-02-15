class Adventure < ActiveRecord::Base
  has_many :pages, dependent: :destroy
  belongs_to :library

  before_save {|adv| adv.guid = create_guid }

  private 

    def create_guid
      SecureRandom.urlsafe_base64(10)
    end

end
