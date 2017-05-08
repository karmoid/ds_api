class AddPlaceToDevices < ActiveRecord::Migration[5.0]
  def change
    add_reference :devices, :place, foreign_key: true
  end
end
