BandLand.Views.DashboardShow = Backbone.View.extend({

  template: JST['dashboard/show'],
  
  render: function() {
		var currentUser = BandLand.currentUser
    var content = this.template({
      currentUser: currentUser
    });
    this.$el.html(content);
    return this
  }
  
  
})