BandLand.Views.StaticIndex = Backbone.View.extend({
	template: JST["static/index"],
	
	events: {
		"click button#refresh": "refresh"
	},
	
	initialize: function (options) {
	},
	
	refresh: function () {
	},
	
	render: function () {
		var renderedContent = this.template();
		
		this.$el.html(renderedContent);
		
		return this;
	}
});