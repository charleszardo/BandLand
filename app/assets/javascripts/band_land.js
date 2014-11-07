window.BandLand = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		BandLand.Collections.bands.fetch();
		new BandLand.Routers.AppRouter();
		
	  audiojs.events.ready(function() {
	    var as = audiojs.createAll();
	  });
		
		Backbone.history.start();
  }
};

