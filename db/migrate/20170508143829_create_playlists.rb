class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.string :name, null: false
      t.text :note
      t.timestamps
    end
    add_index :playlists, :name,                unique: true

  end
end
