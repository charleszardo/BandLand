BandLand.Views.About = Backbone.View.extend({

  template: JST['static/about'],
  
  render: function() {
		var currentUser = BandLand.currentUser
    var content = this.template({
      currentUser: currentUser
    });
    this.$el.html(content);
    return this
  }
})