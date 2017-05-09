class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :note
  has_many :playitems
end
