json.array! @albums do |album|
	json.id							album.id
	json.name						album.name
	json.release_date		album.release_date
	json.about					album.about
	json.credits				album.credits
	json.privacy				album.privacy
	json.band_id				album.band_id
	json.user_id				album.user_id
	json.created_at			album.created_at
	json.updated_at			album.updated_at
	json.filepicker_url	album.filepicker_url
end