import _ from 'lodash'
import $ from 'jquery'
import Backbone from 'backbone'
import './stylesheets/menu.css'
import './stylesheets/style.css'

import SessionModel from './models/session-model.js'
import LoginView from './views/login.js'
import GroupItemCollectionView from './views/group-item-collection-view.js'
import GroupItemCollection from './collections/group-item-collection.js'

let session;

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
      collection: new GroupItemCollection(),
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

    let loginView = new LoginView({ session: session });
    $('#main-content').replaceWith(loginView.render().el);
  }
});

$(document).ready(function() {
  new TodoRouter
  session = new SessionModel();
  Backbone.history.start();
});
