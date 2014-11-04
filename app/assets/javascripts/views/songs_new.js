BandLand.Views.SongsNew = Backbone.View.extend({
	template: JST["songs/new"],
	
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
		
		var params = $(event.currentTarget).serializeJSON()["song"];
		
		var newSong = new BandLand.Models.Song(params);
		newSong.set("band_id", 1);
		newSong.set("user_id", 1);
		newSong.set("privacy", "public");
		newSong.save({}, {
			success: function () {
				BandLand.Collections.songs.add(newSong);
				Backbone.history.navigate("", { trigger: true })
			}
		});
	}
})