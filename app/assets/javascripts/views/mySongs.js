BandLand.Views.MySongs = Backbone.View.extend({

  template: JST['songs/mysongs'],
  
  initialize: function() {
    this.listenTo(this.collection, "sync", this.render)
  },
  
  render: function() {
    var content = this.template({
      songs: this.collection
    });
    this.$el.html(content);
    return this
  }
  
  
})