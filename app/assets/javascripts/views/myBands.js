BandLand.Views.MyBands = Backbone.View.extend({

  template: JST['bands/mybands'],
  
  initialize: function() {
    this.listenTo(this.collection, "sync", this.render)
  },
  
  render: function() {
		var currentUser = BandLand.currentUser
    var content = this.template({
      bands: this.collection,
			currentUser: currentUser
    });
    this.$el.html(content);
    return this
  }
  
  
})