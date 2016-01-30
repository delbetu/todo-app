var app = app || {};

app.AppView = Backbone.View.extend({

  initialize: function() {
    this.listenTo(app.todos, 'all', this.render)
  },

  render: function() {
    $('.todo-list').html('');
    app.todos.each(function(todo) {
      var item = new app.ItemView({ model: todo });
      $('.todo-list').append(item.render().el)
    });
  }
});

$(document).ready(function() {
  app.todos = new ItemCollection();
  var App = new app.AppView;
  app.todos.add(new app.Item({ title: 'Pay bills', completed: true }));
  app.todos.add(new app.Item({ title: 'Pay credit card', completed: false }));
});

