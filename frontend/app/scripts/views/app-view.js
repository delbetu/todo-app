var ENTER_KEY = 13;

AppView = Backbone.View.extend({

  el: '.todoapp',

  initialize: function() {
    this.newItemInput = this.$('input.new-todo');

    this.listenTo(todos, 'all', this.render)

    todos.fetch();
  },

  events: {
    'keypress .new-todo': 'createOnEnter'
  },

  render: function() {
    $('.todo-list').html('');
    todos.each(function(todo) {
      var item = new ItemView({ model: todo });
      $('.todo-list').append(item.render().el);
    });
  },

  createOnEnter: function(e) {
    if (e.which !== ENTER_KEY) return;
    if (this.newItemInput.val() === '') return;

    todos.create({ item: { title: this.newItemInput.val() } });
    this.newItemInput.val('');
  }
});

$(document).ready(function() {
  todos = new ItemCollection();
  var App = new AppView;
});

