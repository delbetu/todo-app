let User = Backbone.Model.extend({
  idAttribute: "id",

  defaults: function() {
    return {
      user: {
        name: '',
        email: '',
        password: ''
      }
    }
  },

  parse: function(response) {
    // Merge generated id attribute into the current object
    this.attributes.user.id = response.id
    return this.attributes
  }
});

export default User
