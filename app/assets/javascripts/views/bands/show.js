BandLand.Views.BandsShow = Backbone.View.extend({
	template: JST["bands/show"],
	
	initialize: function (options) {
		this.listenTo(this.model, "sync", this.render);
		// this.listenTo(this.model.albums(), "sync", this.render);
		// this.listenTo(this.model.songs(), "sync", this.render);
	},
	
	render: function () {
		var renderedContent = this.template({
			band: this.model
			// albums: this.albums,
			// songs: this.songs
		});
		
		this.$el.html(renderedContent);
		
		return this;
	}
});