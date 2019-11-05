import $ from 'jquery'

let AuthModel = Backbone.Model.extend({

  urlRoot: process.env.apiHost+'/api/v1/auth_token',

  initialize: function () {
    $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
      options.xhrFields = {
        //TODO: Remove this
        withCredentials: true
      };
    });
  },

  login: function(credentials) {
    var that = this;
    var successCallback = function(data) {
      that.saveTokenAndGoToIndex(data.attributes.token)
    };

    if (!this.getLocalToken()) { // Get token from api
      this.save({ credentials: credentials }, { success: successCallback });
    } else { // Use existing token
      this.saveTokenAndGoToIndex(this.getLocalToken())
    }
  },

  saveTokenAndGoToIndex: function (token) {
    this.setLocalToken(token)
    $.ajaxSetup({
      // headers: { 'Authorization': 'Bearer '+data.attributes.token }
      headers: { 'Authorization': token }
    });
    Backbone.history.navigate('', { trigger: true });
  },

  getLocalToken: function () {
    return localStorage.getItem('local_token')
  },

  setLocalToken: function (value) {
    localStorage.setItem('local_token', value)
  }
});

export default AuthModel
