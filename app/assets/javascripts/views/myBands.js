BandLand.Views.MyBands = Backbone.View.extend({

  template: JST['bands/mybands'],
  
  initialize: function() {
    this.listenTo(this.collection, "sync", this.render)
  },
  
  render: function() {
    var content = this.template({
      bands: this.collection
    });
    this.$el.html(content);
    return this
  }
  
  
})