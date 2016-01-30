ItemView = Backbone.View.extend({

  tagName: 'li',

  template: JST["app/templates/item.html.jst"],

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});
