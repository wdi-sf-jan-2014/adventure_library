class Adventure < ActiveRecord::Base
belongs_to :library
has_many :pages
accepts_nested_attributes_for :pages
before_save :get_guid

    def get_guid
        self.guid = SecureRandom.urlsafe_base64(10)
    end
end
