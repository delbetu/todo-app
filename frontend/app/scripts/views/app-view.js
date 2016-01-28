var app = app || {};

app.AppView = {
  init : function() {
    var todos = [
      {
        title: 'Pay bills',
        completed: true
      },
      {
        title: 'Pay credit card',
        completed: false
      }
    ];

    _.each(todos, function(todo) {
      var itemTemplate = window.JST["app/templates/item.html.jst"](todo)
      $('.todo-list').append(itemTemplate)
    });
  }
}
