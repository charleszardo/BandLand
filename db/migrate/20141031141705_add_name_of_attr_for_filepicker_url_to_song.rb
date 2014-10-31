class AddNameOfAttrForFilepickerUrlToSong < ActiveRecord::Migration
  def change
    add_column :songs, :filepicker_url, :string
  end
end
