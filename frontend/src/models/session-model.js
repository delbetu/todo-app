import $ from 'jquery'

let SessionModel = Backbone.Model.extend({

  urlRoot: 'http://localhost:3000/api/v1/user_session',

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

    this.save(credentials, { success: successCallback });
  },

  logout: function() {
    this.destroy({
      success: function (model, response) {
        model.clear();
        model.set({ auth: false, id: null });
      }
    });
    Backbone.history.navigate('login', { trigger: true });
  },
});

export default SessionModel
