class PageSerializer < ActiveModel::Serializer
  attributes :id, :url, :note, :portrait
  has_many :playitems
end
