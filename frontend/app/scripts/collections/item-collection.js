var ItemCollection = Backbone.Collection.extend({
  model: Item,
    url: 'http://localhost:3000/api/v1/items'
});

