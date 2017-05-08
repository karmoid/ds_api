class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :name, :ip, :uuid
  belongs_to :place
  belongs_to :playlist
end
