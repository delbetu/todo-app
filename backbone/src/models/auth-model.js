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
    let that = this;
    let successCallback = function(data) {
      that.saveTokenAndGoToIndex(data.attributes.token)
    };

    if (this.getLocalToken() == null) { // Get token from api
      this.save({ credentials: credentials }, { success: successCallback });
    } else { // Use existing token
      this.saveTokenAndGoToIndex(this.getLocalToken())
    }
  },

  saveTokenAndGoToIndex: function (token) {
    this.setLocalToken(token)
    Backbone.history.navigate('', { trigger: true });
  },

  setTokenForAllRequests: function () {
    $.ajaxSetup({
      // headers: { 'Authorization': 'Bearer '+data.attributes.token }
      headers: { 'Authorization': this.getLocalToken() }
    });
  },

  getLocalToken: function () {
    let localToken = localStorage.getItem('local_token')
    let noTokenSaved = localToken == "null" || localToken == undefined
    return (noTokenSaved) ?  null : localToken
  },

  setLocalToken: function (value) {
    localStorage.setItem('local_token', value)
  }
});

export default AuthModel
