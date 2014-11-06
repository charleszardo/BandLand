BandLand.Collections.Songs = Backbone.Collection.extend({
	url: "/api/songs",
	model: BandLand.Models.Song,
	
  getOrFetch: function(id) {
    var song = this.get(id);
      if (!song) {
        song = new BandLand.Models.Song({
          id: id
        });
        
        var that = this;
        
        song.fetch({
          success: function() {
            that.add(song);
          }
        });
      }
      
    return song;
  }
});

BandLand.Collections.songs = new BandLand.Collections.Songs();