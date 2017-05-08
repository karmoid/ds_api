class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :geoloc
  has_many :devices
end
