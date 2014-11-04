BandLand.Collections.Songs = Backbone.Collection.extend({
	url: "/api/songs",
	model: BandLand.Models.Song,
	
	getOrFetch: function (id) {
		var model;
		var songs = this;
		if (model = this.get(id)) {
			return model;
		} else {
			model = new BandLand.Models.Song({ id: id });
			model.fetch( { 
				success: function () { songs.add(model) }
			});
			return model;
		}
	}
});

BandLand.Collections.songs = new BandLand.Collections.Songs();