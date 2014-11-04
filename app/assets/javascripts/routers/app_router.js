BandLand.Routers.AppRouter = Backbone.Router.extend({
	routes: {
		"": "songsIndex",
		"songs/new": "songsNew",
		"songs/:id": "songsShow",
		"bands": "bandsIndex",
		"bands/new": "bandsNew",
		"bands/:id": "bandsShow",
		"albums": "albumsIndex",
		"albums/new": "albumsNew",
		"albums/:id": "albumsShow"
	},
	
	songsIndex: function () {
		var indexView = new BandLand.Views.SongsIndex({
		   collection: BandLand.Collections.songs
		});

		BandLand.Collections.songs.fetch();
		$("body").html(indexView.render().$el);
	},
	
	songsNew: function () {
		var newView = new BandLand.Views.SongsNew();
		$("body").html(newView.render().$el);
	},
	
	songsShow: function (id) {
		var model = BandLand.Collections.songs.getOrFetch(id);
		
		var showView = new BandLand.Views.SongsShow({
			model: model
		});
		
		$("body").html(showView.render().$el);
	}, 
	
	bandsIndex: function () {
		var indexView = new BandLand.Views.BandsIndex({
		   collection: BandLand.Collections.bands
		});

		BandLand.Collections.bands.fetch();
		$("body").html(indexView.render().$el);
	},
	
	bandsNew: function () {
		var newView = new BandLand.Views.BandsNew();
		$("body").html(newView.render().$el);
	},
	
	bandsShow: function (id) {
		var model = BandLand.Collections.bands.getOrFetch(id);
		
		var showView = new BandLand.Views.BandsShow({
			model: model
		});
		
		$("body").html(showView.render().$el);
	},
	
	albumsIndex: function () {
		var indexView = new BandLand.Views.AlbumsIndex({
		   collection: BandLand.Collections.albums
		});

		BandLand.Collections.albums.fetch();
		$("body").html(indexView.render().$el);
	},
	
	albumsNew: function () {
		var newView = new BandLand.Views.AlbumsNew();
		$("body").html(newView.render().$el);
	},
	
	albumsShow: function (id) {
		var model = BandLand.Collections.albums.getOrFetch(id);
		
		var showView = new BandLand.Views.AlbumsShow({
			model: model
		});
		
		$("body").html(showView.render().$el);
	}
});