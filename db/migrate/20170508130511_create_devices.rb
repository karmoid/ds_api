class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :uuid, null: false
      t.string :ip, null: false
      t.timestamps
    end
    add_index :devices, :uuid,                unique: true
  end
end
