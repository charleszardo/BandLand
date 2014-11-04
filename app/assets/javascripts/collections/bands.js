BandLand.Collections.Bands = Backbone.Collection.extend({
	url: "/api/bands",
	model: BandLand.Models.Band
});

BandLand.Collections.bands = new BandLand.Collections.Bands();