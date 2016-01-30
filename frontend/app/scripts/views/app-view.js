var app = app || {};

var ItemCollection = Backbone.Collection.extend();

app.AppView = {
  init : function() {
    var todos = new ItemCollection([
      {
        title: 'Pay bills',
        completed: true
      },
      {
        title: 'Pay credit card',
        completed: false
      }
    ]);

    todos.each(function(todo) {
      var itemTemplate = window.JST["app/templates/item.html.jst"](todo.toJSON())
      $('.todo-list').append(itemTemplate)
    });
  }
}

app.AppView.init();
