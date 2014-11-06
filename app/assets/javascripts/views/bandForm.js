BandLand.Views.BandForm = Backbone.View.extend({
	template: JST["bands/form"],
	
	events: {
		"submit": "create"
	},
	
  create: function(event) {
    event.preventDefault();
    var newBand = new BandLand.Models.Band({ 
      name: this.$('#name').val(),
			location: this.$('#location').val(),
			website: this.$('#website').val(),
			genre: this.$('#genre').val(),
			info: this.$('#info').val(),
			user_id: BandLand.currentUserId,
			filepicker_url: this.$('#filepicker_url').val()
    });
		
    var that = this
    this.collection.create(newBand, { success: function() {
        Backbone.history.navigate("#/bands/"+ that.collection.last().id, true)
      }
    });
    
  },
		
  render: function() {
    var content = this.template({
      band: this.model
    });
    this.$el.html(content)
    
    return this
  }
})
