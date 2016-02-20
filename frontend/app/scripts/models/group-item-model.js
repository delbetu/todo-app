GroupItem = Backbone.Model.extend({
  defaults: function() {
    return {
      listTitle: ''
    }
  },

  parse: function(response, options) {
     return { listTitle: response.list_title };
  }
});
