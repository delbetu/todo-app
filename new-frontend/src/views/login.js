var LoginView = Backbone.View.extend({
  template: require("../templates/login.html"),

  id: 'main-content',

  className: 'container',

  events: {
    'click .button-container button': 'login'
  },

  login: function(e) {
    e.preventDefault();

    var credentials = { email: this.$('#email').val(), password: this.$('#password').val() };
    session.login(credentials);
  },

  render: function() {
    this.$el.html(this.template());
    return this;
  }
});