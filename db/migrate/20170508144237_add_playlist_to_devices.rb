class AddPlaylistToDevices < ActiveRecord::Migration[5.0]
  def change
    add_reference :devices, :playlist, foreign_key: true
  end
end
