GroupItemCollectionView = Backbone.View.extend({
  id: 'left-menu',

  tagName: 'nav',

  className: 'nav',

  initialize: function(options) {
    this.selectedIndex = options.selectedIndex
  },

  render: function() {
    var that = this;
    this.collection.each(function(groupItem, index) {
      var selected = (that.selectedIndex !== 'undefined'
                       && index === that.selectedIndex);

      var groupItemCard = new GroupItemCardView({
        model: groupItem,
        selected: selected
      });

      that.$el.append(groupItemCard.render().el);
    });

    return this;
  }
});
