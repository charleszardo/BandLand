BandLand.Views.BandsShow = Backbone.View.extend({
	template: JST["bands/show"],
	
	initialize: function (options) {
		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.model.albums(), "sync add remove", this.render);
		this.listenTo(this.model.songs(), "sync add remove", this.render);
	},
	
	render: function () {
		var renderedContent = this.template({
			band: this.model
			// albums: this.albums,
			// songs: this.songs
		});
		
		this.$el.html(renderedContent);
		
		this.model.albums().each(function (album) {
			var albumsShowView = new BandLand.Views.AlbumsShow({
				model: album
			});
			
			this.$(".albums").append(albumsShowView.render().$el);
		});
		
		this.model.songs().each(function (song) {
			var songsShowView = new BandLand.Views.SongsShow({
				model: song
			});
			
			this.$(".songs").append(songsShowView.render().$el);
		});
		
		return this;
	}
});