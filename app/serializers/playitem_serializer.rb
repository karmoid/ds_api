class PlayitemSerializer < ActiveModel::Serializer
  attributes :id, :order, :cmd, :value, :page
end
