BandLand.Views.BandForm = Backbone.View.extend({
	template: JST["bands/form"],
	
	events: {
		"submit": "create",
		'change .band-photo-upload': 'handleFile'
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
      name: this.$('#name').val(),
			location: this.$('#location').val(),
			website: this.$('#website').val(),
			genre: this.$('#genre').val(),
			info: this.$('#info').val(),
			user_id: BandLand.currentUserId,
    });
		
    var that = this
    this.collection.create(this.model.attributes, { success: function() {
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
