BandLand.Views.AlbumsNew = Backbone.View.extend({
	template: JST["albums/new"],
	
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
		
		var params = $(event.currentTarget).serializeJSON()["album"];
		
		var newAlbum = new BandLand.Models.Album(params);
		// newSong.set("band_id", 1);
		// newSong.set("user_id", 1);
		// newSong.set("privacy", "public");
		newAlbum.save({}, {
			success: function () {
				BandLand.Collections.albums.add(newAlbum);
				Backbone.history.navigate("", { trigger: true })
			}
		});
	}
})