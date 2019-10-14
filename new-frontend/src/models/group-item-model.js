import ItemCollection from '../collections/item-collection.js'

let GroupItem = Backbone.Model.extend({
  defaults: function() {
    return {
      list_title: '',
      list_items: new ItemCollection
    }
  },

  parse: function(response) {
    response.list_items = new ItemCollection(
      response.list_items,
      { group_item_id: response.id }
    );
    return response;
  }
});

export default GroupItem
