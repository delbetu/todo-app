var LoginView = Backbone.View.extend({
  template: JST["app/templates/login.html.jst"],

  render: function() {
    this.$el.html(this.template());
    return this;
  }
});
