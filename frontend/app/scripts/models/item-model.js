Item = Backbone.Model.extend({
  defaults: function() {
    return {
      title: '',
      completed: false
    }
  },

  toggle: function() {
    this.save({ item: { 'completed': !this.get('completed') } });
  }
});
