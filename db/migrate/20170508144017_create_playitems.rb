class CreatePlayitems < ActiveRecord::Migration[5.0]
  def change
    create_table :playitems do |t|
      t.integer :order, null: false
      t.integer :cmd, null: false
      t.integer :value, null: false
      t.references :page, foreign_key: true
      t.references :playlist, foreign_key: true
      t.timestamps
    end
  end
end
