var ENTER_KEY = 13;

GroupItemView = Backbone.View.extend({

  el: '.todoapp',

  initialize: function() {
    this.collection = new ItemCollection();

    this.newItemInput = this.$('input.new-todo');

    this.listenTo(this.collection, 'all', this.render)

    this.collection.fetch();
  },

  events: {
    'keypress .new-todo': 'createOnEnter'
  },

  render: function() {
    var $element = this.$el;
    $element.find('.todo-list').html('');
    this.collection.each(function(todo) {
      var item = new ItemView({ model: todo });
      $element.find('.todo-list').append(item.render().el);
    });
  },

  createOnEnter: function(e) {
    if (e.which !== ENTER_KEY) return;
    if (this.newItemInput.val() === '') return;

    this.collection.create({ item: { title: this.newItemInput.val() } });
    this.newItemInput.val('');
  }
});

