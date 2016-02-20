var ENTER_KEY = 13;

GroupItemView = Backbone.View.extend({
  tagName: 'section',

  id: 'main-content',

  className: 'todoapp',

  template: JST["app/templates/group-item.html.jst"],


  initialize: function() {
    this.collection = new ItemCollection();

    this.newItemInput = this.$('input.new-todo');

    this.listenTo(this.collection, 'all', this.render)

    this.collection.fetch();
  },

  events: {
    'keypress .new-todo': 'createOnEnter'
  },

  createOnEnter: function(e) {
    if (e.which !== ENTER_KEY) return;
    if (this.newItemInput.val() === '') return;

    this.collection.create({ item: { title: this.newItemInput.val() } });
    this.newItemInput.val('');
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

