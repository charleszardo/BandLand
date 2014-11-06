BandLand.Views.SongsIndex = Backbone.View.extend({
	template: JST["songs/index"],
	
	initialize: function (options) {
		this.listenTo(
			this.collection,
			"sync add",
			this.render);
	},
	
	render: function () {
		var renderedContent = this.template({
			songs: this.collection
		});
		
		this.$el.html(renderedContent);
		
		return this;
	}
});