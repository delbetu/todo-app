var ENTER_KEY = 13;

GroupItemView = Backbone.View.extend({
  tagName: 'section',

  id: 'main-content',

  className: 'todoapp',

  template: JST["app/templates/group-item.html"],

  initialize: function() {

    this.listenTo(this.collection, 'all', this.render);
  },

  events: {
    'keypress .new-todo': 'createOnEnter'
  },

  createOnEnter: function(e) {
    if (e.which !== ENTER_KEY) return;

    var newItemInput = this.$('input.new-todo');
    if (newItemInput.val() === '') return;

    this.collection.create({ title: newItemInput.val() });
    newItemInput.val('');
  },

  render: function() {
    var $template = $(this.template());

    this.collection.each(function(todo) {
      var item = new ItemView({ model: todo });
      $template.find('.todo-list').append(item.render().el);
    });

    this.$el.html($template);
    return this;
  }
});

