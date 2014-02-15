class LibrarySerializer < ActiveModel::Serializer
  attributes :id, :url
  has_many :adventures
end
