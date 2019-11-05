import $ from 'jquery'
import GroupItemView from './group-item-view.js'

let GroupItemCardView = Backbone.View.extend({
  template: require("../templates/group-item-card.html" ),

  className: 'list_item',

  events: {
    'click .destroy' : 'clear',
       'click label' : 'selectGroupItem'
  },

  selectGroupItem: function() {
    var itemsView = new GroupItemView({
      collection: this.model.attributes.list_items,
      title: this.model.attributes.list_title
    });

    this.trigger('groupItemSelected', this.el);

    $('#main-content').replaceWith(itemsView.render().el)
  },

  clear: function() {
    var answer = window.confirm("Deleting a list will destroy all its items. Are you sure?")
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

export default GroupItemCardView
