BandLand.Views.SongsShow = Backbone.View.extend({
	template: JST["songs/show"],
	
	initialize: function (options) {
		this.listenTo(this.model, "sync", this.render);
	},
	
	render: function () {
		var renderedContent = this.template({
			song: this.model
		});
		
		this.$el.html(renderedContent);
		
		return this;
	}
});