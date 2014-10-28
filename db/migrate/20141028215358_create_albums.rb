class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.date :release_date
      t.text :about
      t.text :credits
      t.string :privacy, null: false
      t.integer :band_id, null: false
      t.integer :user_id, null:false

      t.timestamps
    end

    add_index :albums, :band_id
    add_index :albums, :user_id
  end
end
