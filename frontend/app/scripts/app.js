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

    var groupItem = new GroupItem({ listTitle: 'Item menu 1' });
    var menuItem = new GroupItemCardView({ model: groupItem });
    $("body nav.nav").append(menuItem.render().el);

    var groupItem = new GroupItem({ listTitle: 'Item menu 2' });
    var menuItem = new GroupItemCardView({ model: groupItem });
    $("body nav.nav").append(menuItem.render().el);

    var groupItem = new GroupItem({ listTitle: 'Item menu 3' });
    var menuItem = new GroupItemCardView({ model: groupItem, selected: true});
    $("body nav.nav").append(menuItem.render().el);

    $('#main-content').replaceWith(itemsView.render().el);
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
