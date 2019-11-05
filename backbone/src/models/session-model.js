import $ from 'jquery'

let SessionModel = Backbone.Model.extend({

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
    var successCallback =
          function(data) {
            that.set({ auth: true });
            $.ajaxSetup({
              // headers: { 'Authorization': 'Bearer '+data.attributes.token }
              headers: { 'Authorization': data.attributes.token }
            });
            Backbone.history.navigate('', { trigger: true });
          };

    this.save({ credentials: credentials }, { success: successCallback });
  },
});

export default SessionModel
