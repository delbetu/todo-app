GroupItemCollectionView = Backbone.View.extend({
  tagName: 'nav',

  className: 'nav',

  id: 'left-menu',

  template: JST["app/templates/group-item-collection.html.jst"],

  initialize: function(options) {
    this.selectedIndex = options.selectedIndex

    this.listenTo(this.collection, 'all', this.render);

    this.collection.fetch();
  },

  render: function() {
    var nav = $(this.template());

    var that = this;
    this.collection.each(function(groupItem, index) {
      var selected = (that.selectedIndex !== 'undefined'
                       && index === that.selectedIndex);

      var groupItemCard = new GroupItemCardView({
        model: groupItem,
        selected: selected
      });

      nav.prepend(groupItemCard.render().el);
    });

    this.$el.html(nav.html());

    return this;
  }
});
