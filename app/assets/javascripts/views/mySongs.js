BandLand.Views.MySongs = Backbone.View.extend({

  template: JST['songs/mysongs'],
  
  initialize: function() {
    this.listenTo(this.collection, "sync", this.render)
  },
  
  render: function() {
		var currentUser = BandLand.currentUser
    var content = this.template({
      songs: this.collection,
			currentUser: currentUser
    });
    this.$el.html(content);
    return this
  }
  
  
})