BandLand.Collections.Albums = Backbone.Collection.extend({
	url: "/api/albums",
	model: BandLand.Models.Album,
	
  getOrFetch: function(id) {
    var album = this.get(id);
      if (!album) {
        album = new BandLand.Models.Album({
          id: id
        });
        
        var that = this;
        
        album.fetch({
          success: function() {
            that.add(album);
          }
        });
      }
      
    return album;
  }
});

BandLand.Collections.albums = new BandLand.Collections.Albums();