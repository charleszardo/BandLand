BandLand.Collections.Albums = Backbone.Collection.extend({
	url: "/api/albums",
	model: BandLand.Models.Album,
	
	getOrFetch: function (id) {
		var model;
		var albums = this;
		
		if (model = this.get(id)) {
			model.fetch();
			// might want to remove following line
			return model
		} else {
			model = new BandLand.Models.Album({ id: id });
			model.fetch( { 
				success: function () { albums.add(model) }
			});
			return model;
		}
	}
});

BandLand.Collections.albums = new BandLand.Collections.Albums();

// write function for url checking if theres a band id 