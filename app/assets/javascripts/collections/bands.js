BandLand.Collections.Bands = Backbone.Collection.extend({
	url: "/api/bands",
	model: BandLand.Models.Band,
	
  getOrFetch: function(id) {
    var band = this.get(id);
      if (!band) {
        band = new BandLand.Models.Band({
          id: id
        });
        
        var that = this;
        
        band.fetch({
          success: function() {
            that.add(band);
          }
        });
      } else {
      	band.fetch();
      }
      
    return band;
  }
});

BandLand.Collections.bands = new BandLand.Collections.Bands();