var ItemCollection = Backbone.Collection.extend({
  model: Item,
  url: function() {
    var url = 'http://localhost:3000/api/v1/group_item/';
    url += this.group_item_id;
    url += '/items';
    return url;
  },

  initialize: function(model, options) {
    if (options !== undefined) {
      this.group_item_id = options.group_item_id;
    }
  }
});
