BandLand.Views.SongForm = Backbone.View.extend({
	template: JST["songs/form"],
	
	events: {
		"submit": "create"
	},
	
  create: function(event) {
    event.preventDefault();
    var newSong = new BandLand.Models.Song({ 
      title: this.$('#title').val(),
			release_date: this.$('#release_date').val(),
			about: this.$('#about').val(),
			credits: this.$('#credits').val(),
			privacy: this.$('#privacy').val(),
			band_id: this.$('#band_id').val(),
			album_id: this.$('#album_id').val(),
			user_id: BandLand.currentUserId,
			filepicker_url: this.$('#filepicker_url').val()
    });
		
    var that = this
    this.collection.create(newSong, { success: function() {
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
