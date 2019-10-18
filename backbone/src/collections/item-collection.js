import Item from '../models/item-model.js'

let ItemCollection = Backbone.Collection.extend({
  model: Item,
  url: function() {
    let url = process.env.apiHost+'/api/v1/group_items/';
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

export default ItemCollection
