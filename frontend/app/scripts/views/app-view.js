app.AppView = Backbone.View.extend({

  initialize: function() {
    this.listenTo(app.todos, 'all', this.render)
  },

  render: function() {
    $('.todo-list').html('');
    app.todos.each(function(todo) {
      var itemTemplate = window.JST["app/templates/item.html.jst"](todo.toJSON())
      $('.todo-list').append(itemTemplate)
    });
  }
});

$(document).ready(function() {
  app.todos = new ItemCollection();
  var App = new app.AppView;
  app.todos.add({ title: 'Pay bills', completed: true });
  app.todos.add({ title: 'Pay credit card', completed: false });
});

