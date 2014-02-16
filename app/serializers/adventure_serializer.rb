class AdventureSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :guid, :library_id
  has_many :pages
end
