import AuthModel from '../models/auth-model.js'

let LoginView = Backbone.View.extend({
  template: require("../templates/login.html"),

  id: 'main-content',

  className: 'container',

  events: {
    'click .button-container button': 'login'
  },

  initialize: function(options) {
    this.options = options
  },

  login: function(e) {
    e.preventDefault();

    var credentials = { email: this.$('#email').val(), password: this.$('#password').val() };
    this.options.auth.login(credentials);
  },

  render: function() {
    this.$el.html(this.template);
    return this;
  }
});

export default LoginView
