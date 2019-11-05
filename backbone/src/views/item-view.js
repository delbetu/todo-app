
let ItemView = Backbone.View.extend({

  tagName: 'li',

  template: require("../templates/item.html"),

  events: {
    'click .toggle': 'toggleCompleted',
    'click .destroy': 'clear'
  },

  toggleCompleted: function() {
    this.model.toggle();
  },

  clear: function() {
    var answer = window.confirm("Are you sure?")
    if (answer) {
      this.model.destroy();
      this.remove();
    }
  },

  render: function() {
    this.$el.html(_.template(this.template)(this.model.toJSON()));
    return this;
  }
});

export default ItemView
