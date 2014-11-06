BandLand.Collections.Users = Backbone.Collection.extend({
  url: 'api/users',
  
  getOrFetch: function(id) {
    var user = this.get(id);
      if (!user) {
        user = new BandLand.Models.User({
          id: id
        });
        
        var that = this;
        
        user.fetch({
          success: function() {
            that.add(user);
          }
        });
      }
      
    return user;
  }
  
  
  
})