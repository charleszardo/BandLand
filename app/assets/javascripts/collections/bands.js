BandLand.Collections.Bands = Backbone.Collection.extend({
	url: "/api/bands",
	model: BandLand.Models.Band,
	
	getOrFetch: function (id) {
		var model;
		var bands = this;
		
		if (model = this.get(id)) {
			model.fetch();
			// might want to remove following line
			return model
		} else {
			model = new BandLand.Models.Band({ id: id });
			model.fetch( { 
				success: function () { bands.add(model) }
			});
			return model;
		}
	}
});

BandLand.Collections.bands = new BandLand.Collections.Bands();