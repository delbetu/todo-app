import UserCollection from '../collections/user-collection.js'
import User from '../models/user-model.js'

let SignupView = Backbone.View.extend({
  template: require("../templates/signup.html"),

  id: 'main-content',

  className: 'container',

  events: {
    'click .button-container button': 'signup'
  },

  initialize: function(arg) {
    this.collection = arg.collection
    this.onCreationSuccess = arg.onCreationSuccess
  },

  signup: function(e) {
    e.preventDefault();

    let newUser = new User({ user: {
      name: this.$('#name').val(),
      email: this.$('#email').val(),
      password: this.$('#password').val()
    }})

    let that = this
    this.collection.create(newUser, {
      error: function(a, response, c) {
        that.$('#error-message').text(response.responseJSON.errors[0])
        that.$('#error-message').show(100)
      },
      success: this.onCreationSuccess
    })
  },

  render: function() {
    this.$el.html(this.template);
    return this;
  }
})

export default SignupView
