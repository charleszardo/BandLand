BandLand.Views.SessionForm = Backbone.View.extend({
	template: JST["session/new"],
	
	events: {
		"submit": "create"
	},
	
	create: function(event) {
    event.preventDefault();
    this.model.set({ 
      title: this.$('#title').val(),
			release_date: this.$('#release_date').val(),
			about: this.$('#about').val(),
			credits: this.$('#credits').val(),
			privacy: this.$('#privacy').val(),
			band_id: this.$('#band_id').val(),
			album_id: this.$('#album_id').val(),
			user_id: BandLand.currentUserId
    });
		
    var that = this
    this.collection.create(this.model.attributes, { success: function() {
        Backbone.history.navigate("#/songs/"+ that.collection.last().id, true)
      }
    });
    
  },
		
  render: function() {
    var content = this.template({
      song: this.model
    })
    this.$el.html(content)
    
    return this
  }
})
