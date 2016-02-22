$(document).ajaxError(function(event, jqxhr, settings, thrownError) {
  if (jqxhr.status === 403) {
    Backbone.history.navigate('login', { trigger: true });
  }
});

var TodoRouter = Backbone.Router.extend({
  routes: {
         "" : "index",
    "login" : "login"
  },

  index: function() {
    if (!session.attributes.auth) {
      Backbone.history.navigate('login', { trigger: true });
      return;
    }

    var menuItems = new GroupItemCollectionView({
      collection: new GroupItemCollection,
      selectedIndex: 0
    });

    $('nav#left-menu').replaceWith(menuItems.render().el);

    $('#main-content').html('');
    $('.menu-toogle').show();
    $('.logout').show();
    $('#left-menu').show();

    $('.logout button').on('click', function(e) {
      session.logout();
    });
  },

  login: function() {
    $('.menu-toogle').hide();
    $('.logout').hide();
    $('#left-menu').hide();

    var loginView = new LoginView();
    $('#main-content').replaceWith(loginView.render().el);
  }
});

$(document).ready(function() {
  session = new SessionModel();

  new TodoRouter
  Backbone.history.start();
});
