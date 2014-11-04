BandLand.Collections.Songs = Backbone.Collection.extend({
	url: "/api/songs",
	model: BandLand.Models.Song
});

BandLand.Collections.songs = new BandLand.Collections.Songs();