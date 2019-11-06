import $ from 'jquery'
import ItemView from './item-view.js'

var ENTER_KEY = 13;

let GroupItemView = Backbone.View.extend({
  tagName: 'section',

  id: 'main-content',

  className: 'todoapp',

  template: require("../templates/group-item.html"),

  initialize: function(options) {
    this.collection.fetch()
    this.title = options['title'];
    this.listenTo(this.collection, 'all', this.render);
  },

  events: {
    'keypress .new-todo': 'createOnEnter'
  },

  createOnEnter: function(e) {
    if (e.which !== ENTER_KEY) return

    var newItemInput = this.$('input.new-todo')
    if (newItemInput.val() === '') return

    this.collection.create({ title: newItemInput.val() })
    newItemInput.val('')
  },

  render: function() {
    var $template = $(_.template(this.template)({ title: this.title }));

    this.collection.each(function(todo) {
      var item = new ItemView({ model: todo })
      $template.find('.todo-list').append(item.render().el)
    });

    this.$el.html($template)
    this.$el.find('input.new-todo').focus()
    return this;
  }
});

export default GroupItemView
