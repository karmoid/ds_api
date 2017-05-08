class PlayitemSerializer < ActiveModel::Serializer
  attributes :id, :order, :cmd, :value
  has_one :page
  belongs_to :playlist
end
