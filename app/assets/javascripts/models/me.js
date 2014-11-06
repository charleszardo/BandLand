BandLand.Models.Me = Backbone.Model.extend({
  urlRoot: 'api/dashboard',
	
  bands: function() {
    this._bands = this._bands ||
      new BandLand.Collections.myBands([], { user: this });
      return this._bands
  },
	
  albums: function() {
    this._albums = this._albums ||
      new BandLand.Collections.myAlbums([], { user: this });
      return this._albums
  },
	
  songs: function() {
    this._songs = this._songs ||
      new BandLand.Collections.mySongs([], { user: this });
      return this._songs
  },

	parse: function (jsonResp) {
		if (jsonResp.bands) {
			this.bands().set(jsonResp.bands, { parse: true });
			delete jsonResp.bands
		}
		
		if (jsonResp.albums) {
			this.albums().set(jsonResp.albums, { parse: true });
			delete jsonResp.albums
		}
		
		if (jsonResp.songs) {
			this.songs().set(jsonResp.songs, { parse: true});
			delete jsonResp.songs
		}
		
		return jsonResp;
	} 

})

BandLand.Models.me = new BandLand.Models.Me()