AppView = Backbone.View.extend({

  initialize: function() {
    this.listenTo(todos, 'all', this.render)
  },

  render: function() {
    $('.todo-list').html('');
    todos.each(function(todo) {
      var item = new ItemView({ model: todo });
      $('.todo-list').append(item.render().el)
    });
  }
});

$(document).ready(function() {
  todos = new ItemCollection();
  var App = new AppView;
  todos.add(new Item({ title: 'Pay bills', completed: true }));
  todos.add(new Item({ title: 'Pay credit card', completed: false }));
});

