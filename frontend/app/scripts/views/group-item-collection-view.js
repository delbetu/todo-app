var ENTER_KEY = 13;

GroupItemCollectionView = Backbone.View.extend({
  tagName: 'nav',

  className: 'nav',

  id: 'left-menu',

  template: JST["app/templates/group-item-collection.html"],

  initialize: function(options) {
    this.selectedIndex = options.selectedIndex

    this.listenTo(this.collection, 'all', this.render);

    this.collection.fetch();
  },

  events: {
    'keypress .create input' : 'createOnEnter'
  },

  createOnEnter: function(e) {
    var input = this.$('.create input');

    if (e.which !== ENTER_KEY) return;
    if (input === '') return;

    this.collection.create({ list_title: input.val() });
    input.val('');
  },

  render: function() {
    var $template = $(this.template());

    var that = this;
    this.collection.each(function(groupItem, index) {
      var selected = (that.selectedIndex !== 'undefined'
                       && index === that.selectedIndex);

      var groupItemCard = new GroupItemCardView({
        model: groupItem,
        selected: selected
      });

      $template.append(groupItemCard.render().el);
    });


    this.$el.html($template);

    return this;
  }
});
