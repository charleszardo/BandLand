BandLand.Views.SongsShow = Backbone.View.extend({
	template: JST["songs/show"],
	
	events: {
		"click button.destroy": "destroy"
	},
	
	initialize: function (options) {
		this.listenTo(this.model, "sync", this.render);
	},
	
	render: function () {
		var renderedContent = this.template({
			song: this.model
		});
		
		this.$el.html(renderedContent);
		
		return this;
	},
	
	destroy: function () {
		event.preventDefault();
		this.model.destroy();
	}
});