class AddNameOfAttrForFilepickerUrlToBand < ActiveRecord::Migration
  def change
    add_column :bands, :filepicker_url, :string
  end
end
