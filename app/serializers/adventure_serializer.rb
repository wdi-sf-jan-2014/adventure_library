class AdventureSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :guid, :pages, :library_id
  has_many :pages
end
