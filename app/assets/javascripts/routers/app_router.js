BandLand.Routers.AppRouter = Backbone.Router.extend({
	initialize: function($rootEl, $header, $footer) {
		this.$rootEl = $('#content');
		this.bands = new BandLand.Collections.Bands();
		this.albums = new BandLand.Collections.Albums();
		this.songs = new BandLand.Collections.Songs();
	},
	
	routes: {
		// "" : "landing",
		"landing" : "landing",
		"dashboard": "dashboardShow",
		"users/:id": "userShow",
		"bands": "bandsIndex",
		"bands/new": "bandNew",
		"bands/:id": "bandShow",
		"albums": "albumsIndex",
		"albums/new": "albumNew",
		"albums/:id": "albumShow",
		"songs": "songsIndex",
		"songs/new": "songNew",
		"songs/:id": "songShow",
		"mybands": "myBands",
		"myalbums": "myAlbums",
		"mysongs": "mySongs",
		"session/new": "newSession"
	},
	
	landing: function() {
		var view = new BandLand.Views.Landing();
		
		this._swapView(view);
	},
	
  dashboardShow: function() {
    BandLand.Models.me.fetch();
    var view = new BandLand.Views.DashboardShow({
      model: BandLand.Models.me
    });
    
    this._swapView(view);    
  },
	
  userShow: function(id) {
		   
    var user = new BandLand.Collections.Users().getOrFetch(id)
		
    var view = new BandLand.Views.UserShow({
      model: user
    })
    this._swapView(view)
  },
	
	bandsIndex: function () {
		this.bands.fetch();
		
		var indexView = new BandLand.Views.BandsIndex({
	   collection: this.bands
		});
		this._swapView(indexView);
	},
	
	bandNew: function () {
		var band = new BandLand.Models.Band()
		var newView = new BandLand.Views.BandForm({
			model: band,
			collection: BandLand.Models.me.bands()
		});
		this._swapView(newView);
	},
	
	bandShow: function (id) {
		var model = BandLand.Collections.bands.getOrFetch(id);
		
		var showView = new BandLand.Views.BandShow({
			model: model
		});
		
		this._swapView(showView);
	},
	
	albumsIndex: function () {
		this.albums.fetch()
		var indexView = new BandLand.Views.AlbumsIndex({
		   collection: this.albums
		});
		this._swapView(indexView);
	},
	
	albumNew: function () {
		var album = new BandLand.Models.Album()
		var newView = new BandLand.Views.AlbumForm({
			model: album,
			collection: BandLand.Models.me.albums()
		});
		this._swapView(newView);
	},
	
	albumShow: function (id) {
		var model = BandLand.Collections.albums.getOrFetch(id);
		
		var showView = new BandLand.Views.AlbumShow({
			model: model
		});
		
		this._swapView(showView);
	},
	
	songsIndex: function () {
		this.songs.fetch();
		var indexView = new BandLand.Views.SongsIndex({
	   collection: this.songs
		});
		this._swapView(indexView);
	},
	
	songNew: function () {
		var song = new BandLand.Models.Song()
		var newView = new BandLand.Views.SongForm({
			model: song,
			collection: BandLand.Models.me.songs()
		});
		this._swapView(newView);
	},
	
	songShow: function (id) {
		var model = BandLand.Collections.songs.getOrFetch(id);
		
		var showView = new BandLand.Views.SongShow({
			model: model
		});
		
		this._swapView(showView);
	},
	
  myBands: function() {
    BandLand.Models.me.bands().fetch();
    var view = new BandLand.Views.MyBands({
      collection: BandLand.Models.me.bands() 
    })
    
    this._swapView(view);
  },
	
  myAlbums: function() {
    BandLand.Models.me.albums().fetch();
    var view = new BandLand.Views.MyAlbums({
      collection: BandLand.Models.me.albums() 
    })
    
    this._swapView(view);
  },
	
  mySongs: function() {
    BandLand.Models.me.songs().fetch();
    var view = new BandLand.Views.MySongs({
      collection: BandLand.Models.me.songs() 
    })
    
    this._swapView(view);
  },
	
	newSession: function () {
		var newView = new BandLand.Views.SessionForm();
		this._swapView(newView);
	},
	
	_swapView: function (newView) {
		this._currentView && this._currentView.remove();
		this._currentView = newView;
		this.$rootEl.html(newView.render().$el);
	}
});