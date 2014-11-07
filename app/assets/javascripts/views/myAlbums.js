BandLand.Views.MyAlbums = Backbone.View.extend({

  template: JST['albums/myalbums'],
  
  initialize: function() {
    this.listenTo(this.collection, "sync", this.render)
  },
  
  render: function() {
		var currentUser = BandLand.currentUser
    var content = this.template({
      albums: this.collection,
			currentUser: currentUser
    });
    this.$el.html(content);
    return this
  }
  
  
})