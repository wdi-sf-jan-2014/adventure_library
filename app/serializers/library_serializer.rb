class LibrarySerializer < ActiveModel::Serializer
  attributes :url
  has_many :adventures
end
