BandLand.Models.Band = Backbone.Model.extend({
	urlRoot: "/api/bands",
	
	albums: function () {
		this._albums = this._albums || new BandLand.Collections.Albums([], {
				band: this
			});
		
		return this._albums;
	},
	
	songs: function () {
		this._songs = this._songs || new BandLand.Collections.Songs([], {
				band: this
			});
		
		return this._songs;
	},
	
	parse: function (jsonResp) {
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
});