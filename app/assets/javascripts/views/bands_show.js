BandLand.Views.BandsShow = Backbone.View.extend({
	template: JST["bands/show"],
	
	initialize: function (options) {
		this.listenTo(this.model, "sync", this.render);
	},
	
	render: function () {
		var renderedContent = this.template({
			band: this.model
		});
		
		this.$el.html(renderedContent);
		
		return this;
	}
});