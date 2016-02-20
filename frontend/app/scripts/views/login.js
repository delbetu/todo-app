var LoginView = Backbone.View.extend({
  template: JST["app/templates/login.html.jst"],

  id: 'main-content',

  className: 'container',

  events: {
    'click .button-container button': 'login'
  },

  login: function(e) {
    e.preventDefault();

    var credentials = { email: this.$('#email').val(), password: this.$('#password').val() };

    $.ajax({
      url: "http://localhost:3000/api/v1/user_session/",

      type: 'POST', async: false,

      dataType: 'json',

      xhrFields: { withCredentials: true },

      success: function(data) {
        console.log(data.notice);
        Backbone.history.navigate('');
      },

      error: function(data) {
        console.log(data);
      },

      data: credentials
    });
  },

  render: function() {
    this.$el.html(this.template());
    return this;
  }
});
