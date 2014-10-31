Album.create!([
  {name: "Future Days", release_date: "1971-10-30", about: "", credits: "", privacy: "public", band_id: 1, user_id: 1},
  {name: "Double Fantasy", release_date: nil, about: "", credits: "", privacy: "public", band_id: 2, user_id: 2},
  {name: "Tago Mago", release_date: "1971-02-01", about: "", credits: "", privacy: "public", band_id: 1, user_id: 1},
  {name: "Live Peace in Toronto 1969", release_date: "1969-12-12", about: "", credits: "", privacy: "public", band_id: 2, user_id: 2},
  {name: "Monster Movie", release_date: "1969-08-01", about: "", credits: "", privacy: "public", band_id: 1, user_id: 1}
])
Band.create!([
  {name: "Can", location: "Berlin", website: "", genre: "Experimental", info: "", user_id: 1},
  {name: "Plastic Ono Band", location: "", website: "", genre: "Rock", info: "", user_id: 2}
])
Song.create!([
  {title: "Future Days", release_date: nil, about: "", credits: "", privacy: "public", album_id: 1, band_id: 1, user_id: 1}
  {title: "Spray", release_date: nil, about: "", credits: "", privacy: "public", album_id: 1, band_id: 1, user_id: 1}
  {title: "Moonshake", release_date: nil, about: "", credits: "", privacy: "public", album_id: 1, band_id: 1, user_id: 1}
  {title: "Bel Air", release_date: nil, about: "", credits: "", privacy: "public", album_id: 1, band_id: 1, user_id: 1}
])
Tag.create!([
  {name: "cool"},
  {name: "so kraut"},
  {name: "psychedelic as phuk"},
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
User.create!([
  {username: "holger", password_digest: "$2a$10$BxgIoIP5e0hvykw1KqcnWuQIsuChLTlt782MVv1VEUdlH5vavgkBC", session_token: "7iYBbrY0VngT1LfD-xtGCQ", location: nil, bio: nil, email: "holger@can.com"},
  {username: "klaus", password_digest: "$2a$10$CsXDB6VuOd1ctP4FLLw4leJYLkwrBstnp5M16wag3dSu0MKsi0vO.", session_token: "DNgVXpFrH5DUY5lqqZeB0g", location: nil, bio: nil, email: "klaus@voorman.com"}
])
