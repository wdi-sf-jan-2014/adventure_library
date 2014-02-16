class Adventure < ActiveRecord::Base
    has_many :pages
    belongs_to :library
    accepts_nested_attributes_for :pages

    before_save :get_guid, :make_library_id

    def get_guid
        self.guid = SecureRandom.urlsafe_base64(10)
    end

    def make_library_id
        self.library_id = 1
    end
end
