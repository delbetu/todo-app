ItemView = Backbone.View.extend({

  tagName: 'li',

  template: JST["app/templates/item.html"],

  events: {
    'click .toggle': 'toggleCompleted',
    'click .destroy': 'clear'
  },

  toggleCompleted: function() {
    this.model.toggle();
  },

  clear: function() {
    this.model.destroy();
    this.remove();
  },

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});
