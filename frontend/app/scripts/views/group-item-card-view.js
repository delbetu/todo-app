GroupItemCardView = Backbone.View.extend({
  template: JST["app/templates/group-item-card.html.jst"],

  className: 'nav__item',

  initialize: function(options) {
    this.selected = options.selected
  },

  events: {
    'click .destroy' : 'clear',
       'click label' : 'selectGroupItem'
  },

  selectGroupItem: function() {
    var itemsView = new GroupItemView({
      collection: this.model.attributes.list_items
    });
    $('#main-content').replaceWith(itemsView.render().el)
  },

  clear: function() {
    this.model.destroy();
    this.remove();
  },

  render: function() {
    if (this.selected) {
      this.el.classList.add("current")
    }

    this.$el.html(this.template(this.model.toJSON()));

    return this;
  }
});
