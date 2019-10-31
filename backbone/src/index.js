import _ from 'lodash'
import $ from 'jquery'
import Backbone from 'backbone'
import './stylesheets/menu.css'
import './stylesheets/style.css'
import 'todomvc-app-css/index.css'
import './favicon.ico'

import SessionModel from './models/session-model.js'
import LoginView from './views/login.js'
import GroupItemCollectionView from './views/group-item-collection-view.js'
import GroupItemCollection from './collections/group-item-collection.js'
import SignupView from './views/signup.js'
import UserCollection from './collections/user-collection.js'

let session;

$(document).ajaxError(function(event, jqxhr, settings, thrownError) {
  if (jqxhr.status === 403) {
    Backbone.history.navigate('login', { trigger: true });
  }
});

var TodoRouter = Backbone.Router.extend({
  routes: {
         "" : "index",
    "login" : "login",
    "signup" : "signup"
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
    $('.menu-toogle').hide()
    $('.logout').hide()
    $('#left-menu').hide()

    let loginView = new LoginView({ session: session })
    $('#main-content').replaceWith(loginView.render().el)
    $('#success-message').hide();
  },

  signup: function() {
    $('.menu-toogle').hide();
    $('.logout').hide();
    $('#left-menu').hide();

    let userCollection = new UserCollection()
    let signupView = new SignupView({
      collection: userCollection,
      onCreationSuccess: function(args) {
        Backbone.history.navigate('login', { trigger: true })
        $('#success-message').text(
          'Account Successfully Created. Please login.'
        )
        $('#success-message').show()
      }
    })

    $('#main-content').replaceWith(signupView.render().el)
    $('#error-message').hide()
  }
});

$(document).ready(function() {
  new TodoRouter
  session = new SessionModel()
  Backbone.history.start()
});
