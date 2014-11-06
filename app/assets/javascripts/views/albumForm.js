BandLand.Views.AlbumForm = Backbone.View.extend({
	template: JST["albums/form"],
	
	events: {
		"submit": "create"
	},
	
  create: function(event) {
    event.preventDefault();
    var newAlbum = new BandLand.Models.Album({ 
      name: this.$('#name').val(),
      release_date: this.$('#release_date').val(),
      about: this.$('#about').val(),
			credits: this.$('#credits').val(),
			privacy: this.$('#privacy').val(),
			band_id: this.$('#band_id').val(),
			user_id: BandLand.currentUserId,
			filepicker_url: this.$('#filepicker_url')
    });
		
    var that = this
    this.collection.create(newAlbum, { success: function() {
        Backbone.history.navigate("#/albums/"+ that.collection.last().id, true)
      }
    });
    
  },	
	
  render: function() {
    var content = this.template({
      album: this.model
    })
    this.$el.html(content)
    
    return this
  }
})

