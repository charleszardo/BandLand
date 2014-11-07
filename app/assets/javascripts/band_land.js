window.BandLand = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		
		var data = JSON.parse($("#bootstrapped-json").html());
		this.currentUser = new BandLand.Models.User(data["currentUser"], { parse: true });
		
		BandLand.Collections.bands.fetch();
		new BandLand.Routers.AppRouter();
		
	  audiojs.events.ready(function() {
	    var as = audiojs.createAll();
	  });
		
		Backbone.history.start();
  }
};

