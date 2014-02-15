class AdventureSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :guid
  has_many :pages
end
