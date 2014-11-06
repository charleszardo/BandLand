BandLand.Views.AlbumsIndex = Backbone.View.extend({
	template: JST["albums/index"],
	
	initialize: function (options) {
		this.listenTo(
			this.collection,
			"sync add",
			this.render);
	},
	
	render: function () {
		var renderedContent = this.template({
			albums: this.collection
		});
		
		this.$el.html(renderedContent);
		
		return this;
	}
});