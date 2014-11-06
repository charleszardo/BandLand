json.array! @songs do |song|
	json.id							song.id
	json.title					song.title
	json.release_date		song.release_date
	json.about					song.about
	json.credits				song.credits
	json.privacy				song.privacy
	json.album_id				song.album_id
	json.band_id				song.band_id
	json.user_id				song.user_id
	json.created_at			song.created_at
	json.updated_at			song.updated_at
	json.filpicker_url	song.filepicker_url
end