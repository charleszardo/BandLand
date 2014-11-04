BandLand.Collections.Albums = Backbone.Collection.extend({
	url: "/api/albums",
	model: BandLand.Models.Album
});

BandLand.Collections.albums = new BandLand.Collections.Albums();