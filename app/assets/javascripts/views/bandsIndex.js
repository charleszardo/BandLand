BandLand.Views.BandsIndex = Backbone.View.extend({
	template: JST["bands/index"],
	
	initialize: function (options) {
		this.listenTo(
			this.collection,
			"sync add",
			this.render);
	},
	
	render: function () {
		var renderedContent = this.template({
			bands: this.collection
		});
		
		this.$el.html(renderedContent);
		
		return this;
	}
});