BandLand.Views.SongForm = Backbone.View.extend({
	template: JST["songs/form"],
	
	events: {
		"submit": "create",
		'change .my-photo-upload': 'handleFile',
	},
	
	handleFile: function (event) {
	  var file = event.currentTarget.files[0];
	  var view = this;
	  var reader = new FileReader();
	  reader.onload = function(e) {
	    // note that this isn't saving
	    view.model.set('image', this.result);
	  }
	  reader.readAsDataURL(file);
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
