class AdventureSerializer < ActiveModel::Serializer
  attributes :title, :author, :guid 
  has_many :pages
end