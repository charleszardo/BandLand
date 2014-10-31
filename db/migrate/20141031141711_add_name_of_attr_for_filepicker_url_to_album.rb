class AddNameOfAttrForFilepickerUrlToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :filepicker_url, :string
  end
end
