GroupItemCardView = Backbone.View.extend({
  template: JST["app/templates/group-item-card.html.jst"],

  className: 'nav__item',

  initialize: function(options) {
    this.selected = options.selected
  },

  render: function() {
    if (this.selected) {
      this.el.classList.add("current")
    }

    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});
