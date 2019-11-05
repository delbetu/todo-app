import $ from 'jquery'
import GroupItemCardView from './group-item-card-view.js'

var ENTER_KEY = 13;

let GroupItemCollectionView = Backbone.View.extend({
  tagName: 'nav',

  className: 'nav',

  id: 'left-menu',

  template: require("../templates/group-item-collection.html"),

  initialize: function(options) {
    // TODO: Can I remove this selectedIndex??
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

  groupItemSelectedCallback: function(element) {
    this.$el.find('.list_item').removeClass('current');
    $(element).addClass('current');
  },

  render: function() {
    var $template = $(this.template);

    var that = this;
    this.collection.each(function(groupItem, index) {
      var groupItemCard = new GroupItemCardView({
        model: groupItem
      });

      that.listenTo(
        groupItemCard,
        'groupItemSelected',
        that.groupItemSelectedCallback
        );

      $template.append(groupItemCard.render().el);
    });

    this.$el.html($template);

    return this;
  }
});

export default GroupItemCollectionView
