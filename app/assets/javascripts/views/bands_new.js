BandLand.Views.BandsNew = Backbone.View.extend({
	template: JST["bands/new"],
	
	events: {
		"submit form": "submit"
	},
	
	render: function () {
		var renderedContent = this.template();
		this.$el.html(renderedContent);
		
		return this;
	},
	
	submit: function (event) {
		event.preventDefault();
		
		var params = $(event.currentTarget).serializeJSON()["band"];
		
		var newBand = new BandLand.Models.Band(params);
		// newSong.set("band_id", 1);
		// newSong.set("user_id", 1);
		// newSong.set("privacy", "public");
		newBand.save({}, {
			success: function () {
				BandLand.Collections.bands.add(newBand);
				Backbone.history.navigate("", { trigger: true })
			}
		});
	}
})