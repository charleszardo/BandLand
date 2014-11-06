BandLand.Collections.myAlbums = Backbone.Collection.extend({
  model: BandLand.Models.Album,
  url: '/api/myAlbums'
	 
})