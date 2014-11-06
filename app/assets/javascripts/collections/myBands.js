BandLand.Collections.myBands = Backbone.Collection.extend({
  model: BandLand.Models.Band,
  url: '/api/myBands'
	 
})