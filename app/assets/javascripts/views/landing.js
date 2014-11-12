BandLand.Views.Landing = Backbone.View.extend({

  template: JST['static/index'],
  
  render: function() {
		var currentUser = BandLand.currentUser
    var content = this.template({
      currentUser: currentUser
    });
    this.$el.html(content);
    return this
  }
  
  
})