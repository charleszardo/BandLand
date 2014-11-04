BandLand.Views.SongsIndex = Backbone.View.extend({
	template: JST["songs/index"],
	
	events: {
		"click button#refresh": "refresh"
	},
	
	refresh: function () {
		var view = this;
		
		this.collection.fetch({
			success: function () {
				view.render();
			}
		})
	},
	
	render: function () {
		var renderedContent = this.template({
			songs: this.collection
		});
		
		this.$el.html(renderedContent);
		
		return this;
	}
});