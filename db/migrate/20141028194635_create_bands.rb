class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.string :location
      t.string :website
      t.string :genre
      t.text :info
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :bands, :user_id
  end
end
