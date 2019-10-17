let Item = Backbone.Model.extend({
  defaults: function() {
    return {
      title: '',
      completed: false
    }
  },

  toggle: function() {
    this.save({ completed: !this.get('completed') });
  }
});

export default Item
