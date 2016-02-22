GroupItem = Backbone.Model.extend({
  defaults: function() {
    return {
      list_title: '',
      list_items: new ItemCollection
    }
  },

  parse: function(response) {
    response.list_items = new ItemCollection(
      response.list_items,
      { group_item_id: this.attributes.id }
    );
    return response;
  }
});
