GroupItemCardView = Backbone.View.extend({
  template: JST["app/templates/group-item-card.html.jst"],

  render: function() {
    this.$el.html(this.template());
    return this;
  }
});
