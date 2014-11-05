json.(band, :id, :name, :location, :website, :genre, :info, :taggings, :tags, :followings, :created_at, :updated_at, :user_id)

albums ||= nil
unless albums.nil?
	json.albums(albums) do |alb|
		json.partial!("api/albums/album", :album => alb)
	end
end

songs ||= nil
unless songs.nil?
	json.songs(songs) do |sng|
		json.partial!("api/songs/song", :song => sng)
	end
end