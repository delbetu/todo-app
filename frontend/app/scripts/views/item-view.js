ItemView = Backbone.View.extend({

  tagName: 'li',

  template: JST["app/templates/item.html.jst"],

  events: {
    'click .toggle': 'toggleCompleted'
  },

  toggleCompleted: function() {
    this.model.toggle();
  },

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});
