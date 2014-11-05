BandLand.Views.AlbumsShow = Backbone.View.extend({
	template: JST["albums/show"],
	
	initialize: function (options) {
		this.listenTo(this.model, "sync", this.render);
		// this.listenTo(this.model.songs(), "sync", this.render);
	},
	
	render: function () {
		var renderedContent = this.template({
			album: this.model,
			songs: this.songs
		});
		
		this.$el.html(renderedContent);
		
		return this;
	}
});