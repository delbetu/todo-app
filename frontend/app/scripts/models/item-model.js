var app = app || {};

app.Item = Backbone.Model.extend({
  defaults: function() {
    return {
      title: '',
      completed: false
    }
  }
});
