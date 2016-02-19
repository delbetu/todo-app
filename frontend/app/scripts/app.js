var TodoRouter = Backbone.Router.extend({
  routes: {
    ""      : "index",
    "login" : "login"
  },

  index: function() {
    itemsView = new GroupItemView;
    $('.todoapp').html(itemsView.render().el);
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
