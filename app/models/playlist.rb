
class Playlist < ApplicationRecord
has_many :playitems
has_many :devices
end
