json.extract! current_user, :username, :id

json.bands current_user.bands do |band|
  json.id           	band.id
  json.name         	band.name
  json.location     	band.location
  json.website  			band.website
	json.genre					band.genre
	json.info						band.info
	json.user_id				band.user_id
	json.created_at			band.created_at
	json.updated_at			band.updated_at
	json.filepicker_url	band.filepicker_url
end

json.albums current_user.albums do |album|
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

json.songs current_user.songs do |song|
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