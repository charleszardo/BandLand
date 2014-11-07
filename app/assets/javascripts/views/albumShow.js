BandLand.Views.AlbumShow = Backbone.View.extend({
	template: JST["albums/show"],
	
	initialize: function (options) {
		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.model.songs(), "sync", this.render);
	},
	
	render: function () {
		var renderedContent = this.template({
			album: this.model,
			songs: this.songs
		});
		
		this.$el.html(renderedContent);
		
		this.model.songs().each(function (song) {
			var songsShowView = new BandLand.Views.SongShow({
				model: song
			});
		
			this.$(".songs").append(songsShowView.render().$el);
		});
		
		return this;
	}

});