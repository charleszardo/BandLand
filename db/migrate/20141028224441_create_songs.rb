class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.date :release_date
      t.text :about
      t.text :credits
      t.string :privacy
      t.integer :album_id
      t.integer :band_id, null: false
      t.integer :user_id, null:false

      t.timestamps
    end

    add_index :songs, :album_id
    add_index :songs, :band_id
    add_index :songs, :user_id
  end
end
