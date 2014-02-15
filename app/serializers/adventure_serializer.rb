class AdventureSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :guid, :pages
  has_many :pages
end
