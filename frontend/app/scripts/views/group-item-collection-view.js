GroupItemCollectionView = Backbone.View.extend({
  id: 'left-menu',

  tagName: 'nav',

  className: 'nav',

  initialize: function(options) {
    this.selectedIndex = options.selectedIndex

    this.listenTo(this.collection, 'all', this.render);

    this.collection.fetch();
  },

  render: function() {
    this.$el.html('');

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
