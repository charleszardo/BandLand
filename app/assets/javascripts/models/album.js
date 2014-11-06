BandLand.Models.Album = Backbone.Model.extend({
	urlRoot: "api/albums",
	
	songs: function () {
		this._songs = this._songs || new BandLand.Collections.Songs([], {
				album: this
			});
		
		return this._songs;
	},
	
	parse: function (jsonResp) {
		if (jsonResp.songs) {
			this.songs().set(jsonResp.songs, { parse: true});
			delete jsonResp.songs
		}
		
		return jsonResp;
	} 
});