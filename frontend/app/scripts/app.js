var TodoRouter = Backbone.Router.extend({
  routes: {
    ""      : "index",
    "login" : "login"
  },

  index: function() {
    new GroupItemView;
  },

  login: function() {
    loginView = new LoginView();
    $('body').html(loginView.render().el);
  }
});

$(document).ready(function() {
  new TodoRouter
  Backbone.history.start();
});
