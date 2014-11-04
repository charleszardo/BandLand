window.BandLand = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var view = new BandLand.Views.SongsIndex({
    	collection: BandLand.Collections.songs
    });
		
		BandLand.Collections.songs.fetch({
			success: function () {
				$("body").append(view.render().$el);
			}
		});
		
  }
};

$(document).ready(function(){
  BandLand.initialize();
});
