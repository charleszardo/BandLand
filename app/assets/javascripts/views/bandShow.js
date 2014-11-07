BandLand.Views.BandShow = Backbone.View.extend({
	template: JST["bands/show"],
	
	initialize: function (options) {
		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.model.albums(), "sync", this.render);
		this.listenTo(this.model.songs(), "sync", this.render);
	},
	
	render: function () {
		
		var renderedContent = this.template({
			band: this.model,
			albums: this.model.albums(),
			songs: this.songs
		});
		
		this.$el.html(renderedContent);

		this.model.albums().each(function (album) {
			var albumsShowView = new BandLand.Views.AlbumsIndex({
				model: album
			});

			this.$(".albums").append(albumsShowView.render().$el);
		});
		//
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