class RemoveColumnsFromSong < ActiveRecord::Migration
  def change
    remove_column :songs, :duration
    remove_column :songs, :track_file_name
    remove_column :songs, :track_content_type
    remove_column :songs, :track_file_size
    remove_column :songs, :track_updated_at
    remove_column :songs, :image_file_name
    remove_column :songs, :image_content_type
    remove_column :songs, :image_file_size
    remove_column :songs, :image_updated_at
  end
end