BandLand.Views.SongsIndex = Backbone.View.extend({
	render: function () {
		var $ul = $("<ul>");
		
		BandLand.Collections.songs.each(function (song) {
			var $li = $("<li>");
			
			$li.text(todo.get("title"));
			
			$ul.append($li);
		});
		
		this.$el
	}
});