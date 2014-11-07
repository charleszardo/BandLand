BandLand.Views.AlbumShow = Backbone.View.extend({
	template: JST["albums/show"],
	
	initialize: function (options) {
		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.model.songs(), "sync", this.render);
	},
	
	render: function () {
		var band_id = this.model.get("band_id");
		
		var band = BandLand.Collections.bands.get(band_id);
		
		var renderedContent = this.template({
			album: this.model,
			songs: this.model.songs(),
			band: band
		});
		
		this.$el.html(renderedContent);
		
		// this.model.songs().each(function (song) {
		// 	var songsShowView = new BandLand.Views.SongShow({
		// 		model: song
		// 	});
		//
		// 	this.$(".songs").append(songsShowView.render().$el);
		// });
		
		return this;
	}

});