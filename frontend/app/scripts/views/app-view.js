app.AppView = {
  init : function() {
    app.todos.each(function(todo) {
      var itemTemplate = window.JST["app/templates/item.html.jst"](todo.toJSON())
      $('.todo-list').append(itemTemplate)
    });
  }
}

$(document).ready(function() {
  app.todos = new ItemCollection();
  app.todos.add({ title: 'Pay bills', completed: true });
  app.todos.add({ title: 'Pay credit card', completed: false });

  app.AppView.init();
});

