Item = Backbone.Model.extend({
  defaults: function() {
    return {
      title: '',
      completed: false
    }
  },

  toggle: function() {
    this.set('completed', !this.get('completed'));
  }
});
