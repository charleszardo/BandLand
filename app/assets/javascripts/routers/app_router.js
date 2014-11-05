BandLand.Routers.AppRouter = Backbone.Router.extend({
	routes: {
		"": "staticIndex",
		"songs": "songsIndex",
		"songs/new": "songsNew",
		"songs/:id": "songsShow",
		"bands": "bandsIndex",
		"bands/new": "bandsNew",
		"bands/:id": "bandsShow",
		"albums": "albumsIndex",
		"albums/new": "albumsNew",
		"albums/:id": "albumsShow"
	},
	
	staticIndex: function () {
		var indexView = new BandLand.Views.StaticIndex();
		this._swapView(indexView);
	},
	
	songsIndex: function () {
		var indexView = new BandLand.Views.SongsIndex({
	   collection: BandLand.Collections.songs
		});

		BandLand.Collections.songs.fetch();
		this._swapView(indexView);
	},
	
	songsNew: function () {
		var newView = new BandLand.Views.SongsNew();
		this._swapView(newView);
	},
	
	songsShow: function (id) {
		var model = BandLand.Collections.songs.getOrFetch(id);
		
		var showView = new BandLand.Views.SongsShow({
			model: model
		});
		
		this._swapView(showView);
	}, 
	
	bandsIndex: function () {
		var indexView = new BandLand.Views.BandsIndex({
	   collection: BandLand.Collections.bands
		});

		BandLand.Collections.bands.fetch();
		this._swapView(indexView);
	},
	
	bandsNew: function () {
		var newView = new BandLand.Views.BandsNew();
		this._swapView(newView);
	},
	
	bandsShow: function (id) {
		var model = BandLand.Collections.bands.getOrFetch(id);
		
		var showView = new BandLand.Views.BandsShow({
			model: model
		});
		
		this._swapView(showView);
	},
	
	albumsIndex: function () {
		var indexView = new BandLand.Views.AlbumsIndex({
		   collection: BandLand.Collections.albums
		});

		BandLand.Collections.albums.fetch();
		this._swapView(indexView);
	},
	
	albumsNew: function () {
		var newView = new BandLand.Views.AlbumsNew();
		this._swapView(newView);
	},
	
	albumsShow: function (id) {
		var model = BandLand.Collections.albums.getOrFetch(id);
		
		var showView = new BandLand.Views.AlbumsShow({
			model: model
		});
		
		this._swapView(showView);
	},
	
	_swapView: function (newView) {
		if (this.currentView) {
			this.currentView.remove();
		}
		
		$("body").html(newView.render().$el);
		
		this.currentView = newView;
	}
});