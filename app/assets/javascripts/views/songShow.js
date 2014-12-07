BandLand.Views.SongShow = Backbone.View.extend({
	template: function () {
		return this.open ? JST["songs/edit"] : JST["songs/show"];
	},
	
	events: {
		"click button.destroy": "destroy",
		"dblclick div.title": "beginEditing",
		"submit form": "endEditing"
	},
	
	initialize: function (options) {
		this.listenTo(this.model, "sync", this.render);
		this.open = false;
	},
	
	beginEditing: function () {
		this.open = true;
		this.render();
	},
	
	endEditing: function (event) {
		event.preventDefault();
		this.open = false;
		
		var params = $(event.currentTarget).serializeJSON();
		this.model.set(params["title"]);
		this.model.save();
		// var title = this.$("textarea.song_title").val();
		// this.model.save({ title: title });
		
		this.render();
	},
	
	render: function () {
		var band_id = this.model.escape("band_id")
		
		
		var renderedContent = this.template()({
			song: this.model,
			band: this.model.attributes.band_id,
			track: this.model.attributes.track
		});
		
		this.$el.html(renderedContent);
		
		return this;
	},
	
	destroy: function () {
		event.preventDefault();
		this.model.destroy();
	}
});