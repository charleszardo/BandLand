window.BandLand = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		new BandLand.Routers.AppRouter();
		Backbone.history.start();
  }
};

$(document).ready(function(){
  BandLand.initialize();
});