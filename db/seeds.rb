require 'faker'

Album.create!([
  {name: "Future Days", release_date: "1971-10-30", about: "", credits: "", privacy: "public", band_id: 1, user_id: 1},
  {name: "Double Fantasy", release_date: nil, about: "", credits: "", privacy: "public", band_id: 2, user_id: 2},
  {name: "Tago Mago", release_date: "1971-02-01", about: "", credits: "", privacy: "public", band_id: 1, user_id: 1},
  {name: "Live Peace in Toronto 1969", release_date: "1969-12-12", about: "", credits: "", privacy: "public", band_id: 2, user_id: 2},
  {name: "Monster Movie", release_date: "1969-08-01", about: "", credits: "", privacy: "public", band_id: 1, user_id: 1}
])
Band.create!([
  {name: "Can", location: "Cologne, Germany", website: "www.spoonrecords.com/history/can.php
", genre: "Experimental", info: "The beginning and the end.", user_id: 1},
  {name: "Plastic Ono Band", location: "New York, NY", website: "yopob.com", genre: "Rock", info: "I don't believe in Beatles", user_id: 2}
])
Song.create!([
  {title: "Future Days", release_date: nil, about: "", credits: "", privacy: "public", album_id: 1, band_id: 1, user_id: 1},
  {title: "Spray", release_date: nil, about: "", credits: "", privacy: "public", album_id: 1, band_id: 1, user_id: 1},
  {title: "Moonshake", release_date: nil, about: "", credits: "", privacy: "public", album_id: 1, band_id: 1, user_id: 1},
  {title: "Bel Air", release_date: nil, about: "", credits: "", privacy: "public", album_id: 1, band_id: 1, user_id: 1}
])
Tag.create!([
  {name: "cool"},
  {name: "so kraut"},
  {name: "2 psychedeli"},
  {name: "heady"},
  {name: "das best"}
])
Tagging.create!([
  {tag_id: 1, taggable_id: 1, taggable_type: "Band"},
  {tag_id: 1, taggable_id: 1, taggable_type: "Album"},
  {tag_id: 2, taggable_id: 3, taggable_type: "Album"},
  {tag_id: 3, taggable_id: 1, taggable_type: "Album"},
  {tag_id: 4, taggable_id: 2, taggable_type: "Band"},
  {tag_id: 5, taggable_id: 2, taggable_type: "Album"},
])

holger = User.new
holger.username = "holger"
holger.password = "123456"
holger.email = "holger@czukay.de"
holger.location = "Tokyo, Japan"
holger.save

klaus = User.new
klaus.username = "klaus"
klaus.password = "123456"
holger.location = "Berlin, Germany"
klaus.email = "klaus@voorman.de"
klaus.save

dummy = User.new
dummy.username = "test"
dummy.location = "NY, NY"
dummy.password = "123456"
dummy.email = "dummy@dummy.com"
dummy.save

30.times do 
  band = Band.new
  band.name = Faker::Company.bs
  band.genre = "Experimental"
  band.user_id = 3
  band.save
end

