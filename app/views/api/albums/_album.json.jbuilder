json.(album, :id, :name, :release_date, :about, :credits, :privacy, :taggings, :tags, :created_at, :updated_at, :user_id, :band_id, :image)

songs ||= nil
unless songs.nil?
	json.songs(songs) do |sng|
		json.partial!("api/songs/song", :song => sng)
	end
end