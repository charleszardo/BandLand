BandLand.Models.Band = Backbone.Model.extend({
	urlRoot: "/api/bands",
	
	albums: function () {
		return new BandLand.Collections.Albums([], {
			album: this
		});
	}
});