class AdventureSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :guid, :library_id, :created_at, :updated_at, :pages
  has_many :pages
end
