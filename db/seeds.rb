Album.create!([
  {name: "Future Days", release_date: "1973-10-30", about: "Fifth studio album by the German experimental rock group Can, last to feature vocalist Damo Suzuki. Ambient sounds, \"an almost painterly sense of blended colors and landscapes.\"", credits: "Holger Czukay – bass, double bass, Michael Karoli – guitar, violin, Jaki Liebezeit – drums, percussion, Irmin Schmidt – keyboards, synthesizers, Damo Suzuki – vocals, percussion", privacy: "public", band_id: 4, user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 14228, image_updated_at: "2014-11-07 19:52:18"},
  {name: "Monster Movie", release_date: nil, about: "", credits: "", privacy: "public", band_id: 4, user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 14740, image_updated_at: "2014-11-07 19:57:54"},
  {name: "Tago Mago", release_date: nil, about: "", credits: "", privacy: "public", band_id: 4, user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 23002, image_updated_at: "2014-11-07 19:58:23"},
  {name: "Soundtracks", release_date: nil, about: "", credits: "", privacy: "public", band_id: 4, user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 11281, image_updated_at: "2014-11-07 19:58:58"},
  {name: "Landed", release_date: nil, about: "", credits: "", privacy: "public", band_id: 4, user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 15013, image_updated_at: "2014-11-07 19:59:15"}
])
Band.create!([
  {name: "Mac DeMarco", location: "Brooklyn, NY", website: "www.bigmaxxx.com", genre: "Folk", info: "salad days r gone", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 15624, image_updated_at: "2014-11-07 19:30:56"},
  {name: "Ariel Pink", location: "Hollyweird", website: "www.pink.com", genre: "Acoustic", info: "don't wanna talk about mature themes", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 5453, image_updated_at: "2014-11-07 19:34:30"},
  {name: "David Bowie", location: "NY, NY", website: "www.ziggyspaceman.com", genre: "Acoustic", info: "i'm an alligator, i'm a momma poppa comin for you", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 6021, image_updated_at: "2014-11-07 19:36:14"},
  {name: "Can", location: "Cologne, Germany", website: "www.cancancan.com", genre: "Acoustic", info: "the beginning and the end", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 29629, image_updated_at: "2014-11-07 19:36:52"},
  {name: "Devendra Banhart", location: "here, there, everywhere", website: "www.devendrabanhart.com", genre: "Acoustic", info: "white reggae troll", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 6919, image_updated_at: "2014-11-07 19:39:28"},
  {name: "Juan Wuaters", location: "Queens, NYC", website: "huh?", genre: "Acoustic", info: "not tall juan", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 9735, image_updated_at: "2014-11-07 19:40:05"},
  {name: "Lou Reed", location: "Paradise", website: "www.aol.com", genre: "Acoustic", info: "Sweet Lou", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 4519, image_updated_at: "2014-11-07 19:40:49"},
  {name: "Neu!", location: "Germany", website: "www.internet.com", genre: "Acoustic", info: "Neu! not NEU", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 9288, image_updated_at: "2014-11-07 19:41:18"},
  {name: "Plastic Ono Band", location: "NYC", website: "www.plasticono.com", genre: "Acoustic", info: "Love, love, love", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 7141, image_updated_at: "2014-11-07 19:41:49"},
  {name: "Silver Apples", location: "NYC 60s", website: "www.web.com", genre: "Acoustic", info: "first and foremost", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 13649, image_updated_at: "2014-11-07 19:42:16"},
  {name: "Suicide", location: "Lower East Side", website: "www.yeah.right", genre: "Acoustic", info: "frankie, frankie", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 4795, image_updated_at: "2014-11-07 19:42:52"},
  {name: "Thee Oh Sees", location: "SF", website: "www.theeohsees.com", genre: "Acoustic", info: "toe cutter/thumb buster", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 12504, image_updated_at: "2014-11-07 19:43:35"},
  {name: "T. Rex", location: "London, UK", website: "www.dinosaurs.com", genre: "Acoustic", info: "whatever happened to the teenage dream?", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 8050, image_updated_at: "2014-11-07 19:44:05"},
  {name: "Ty Segall", location: "LA, CA", website: "www.tyguy.com", genre: "Acoustic", info: "the manipulator", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 8875, image_updated_at: "2014-11-07 19:44:30"},
  {name: "iamamiwhoami", location: "space, sweden", website: "www.iamamiwhoami.com", genre: "Acoustic", info: "1sakdfoa83124", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 4733, image_updated_at: "2014-11-07 19:47:24"},
  {name: "Sonny Sharrock", location: "Ossining, NY", website: "www.sunnysonny.com", genre: "Acoustic", info: "portraits", user_id: 1, filepicker_url: nil, image_file_name: "data", image_content_type: "image/jpeg", image_file_size: 5500, image_updated_at: "2014-11-07 19:48:09"}
])
Song.create!([
  {title: "Future Days", release_date: "1973-10-30", about: "", credits: "", privacy: "public", album_id: 1, band_id: 4, user_id: 1, filepicker_url: nil, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, track_file_name: "data", track_content_type: "audio/mpeg", track_file_size: 9112504, track_updated_at: "2014-11-07 19:53:21"}
])
User.create!([
  {username: "klaus", password_digest: "$2a$10$5oGPOsH1hHxitdmmlT2My.vBYRy2ux15BaAhq/WCX7nfC/.ec8WRi", session_token: "sX-SdAEnilRCk_7DPAzjDw", location: nil, bio: "the beatle", email: "klaus@voorman.de", filepicker_url: nil},
  {username: "test", password_digest: "$2a$10$Jml5eMUmQ/pAFYra2wEMlOiyA6/WX/2dJHiTp3hs91DjUAWqIILRS", session_token: "hM_Kz7pkDKfggjkiA2rCgw", location: "NY, NY", bio: nil, email: "dummy@dummy.com", filepicker_url: nil},
  {username: "holger", password_digest: "$2a$10$RjcmHM6pEWKyu4LXdfRLdu4IXWAMV9.aZYHjhOBM9yGjP3wyyU2BG", session_token: "o-GgvLTGLsEtWlJKVkReCQ", location: "Tokyo, Japan", bio: "godfather of sampling", email: "holger@czukay.de", filepicker_url: "https://www.filepicker.io/api/file/LkswwyhfR2mzMRhlscC7"}
])
