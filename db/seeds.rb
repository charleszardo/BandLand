Album.create!([
  {name: "Future Days", release_date: "1971-10-30", about: "", credits: "", privacy: "public", band_id: 8, user_id: 16},
  {name: "Double Fantasy", release_date: nil, about: "", credits: "", privacy: "public", band_id: 9, user_id: 17}
])
Band.create!([
  {name: "Can", location: "Berlin", website: "", genre: "Experimental", info: "", user_id: 16},
  {name: "Plastic Ono Band", location: "", website: "", genre: "Rock", info: "", user_id: 17}
])
Song.create!([
  {title: "Future Days", release_date: nil, about: "", credits: "", privacy: "public", album_id: 11, band_id: 8, user_id: 16}
])
Tag.create!([
  {name: "cool"},
  {name: " kraut"},
  {name: "luv"}
])
Tagging.create!([
  {tag_id: 31, taggable_id: 8, taggable_type: "Band"},
  {tag_id: 32, taggable_id: 8, taggable_type: "Band"},
  {tag_id: 33, taggable_id: 9, taggable_type: "Band"}
])
User.create!([
  {username: "holger", password_digest: "$2a$10$BxgIoIP5e0hvykw1KqcnWuQIsuChLTlt782MVv1VEUdlH5vavgkBC", session_token: "7iYBbrY0VngT1LfD-xtGCQ", location: nil, bio: nil, email: "holger@can.com"},
  {username: "klaus", password_digest: "$2a$10$CsXDB6VuOd1ctP4FLLw4leJYLkwrBstnp5M16wag3dSu0MKsi0vO.", session_token: "DNgVXpFrH5DUY5lqqZeB0g", location: nil, bio: nil, email: "klaus@voorman.com"}
])
