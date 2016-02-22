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
    var menuItems = new GroupItemCollectionView({
      collection: new GroupItemCollection,
      selectedIndex: 0
    });

    $('nav#left-menu').replaceWith(menuItems.render().el);
  },

  login: function() {
    loginView = new LoginView();
    $('#main-content').replaceWith(loginView.render().el);
  }
});

$(document).ready(function() {
  session = new SessionModel();

  new TodoRouter
  Backbone.history.start();
});
