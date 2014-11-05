BandLand.Views.AlbumsIndex = Backbone.View.extend({
	template: JST["albums/index"],
	
	events: {
		"click button#refresh": "refresh"
	},
	
	initialize: function (options) {
		this.listenTo(
			this.collection,
			"sync add",
			this.render.bind(this)
			);
	},
	
	refresh: function () {
		var view = this;
		
		this.collection.fetch();
	},
	
	render: function () {
		var renderedContent = this.template({
			albums: this.collection
		});
		
		this.$el.html(renderedContent);
		
		return this;
	}
});