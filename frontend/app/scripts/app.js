$(document).ajaxError(function(event, jqxhr, settings, thrownError) {
  if (jqxhr.status === 403) {
    Backbone.history.navigate('login', { trigger: true });
  }
});

var TodoRouter = Backbone.Router.extend({
  routes: {
    ""      : "index",
    "login" : "login"
  },

  index: function() {
    itemsView = new GroupItemView;
    $('#main-content').replaceWith(itemsView.render().el);
  },

  login: function() {
    loginView = new LoginView();
    $('#main-content').replaceWith(loginView.render().el);
  }
});

$(document).ready(function() {
  new TodoRouter
  Backbone.history.start();
});
