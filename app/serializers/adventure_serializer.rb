class AdventureSerializer < ActiveModel::Serializer
  attributes :title, :author, :created_at, :updated_at, :guid
  has_many :pages
end
