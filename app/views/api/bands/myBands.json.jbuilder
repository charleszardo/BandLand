json.array! @bands do |band|
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