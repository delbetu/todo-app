// TODO: Do we need this anonymous function call ?
(function() {

  var proxiedSync = Backbone.sync;

  Backbone.sync = function(method, model, options) {
    options || (options = {});

    if (!options.crossDomain) {
      options.crossDomain = true;
    }

    if (!options.xhrFields) {
      // TODO: This can be removed.
      options.xhrFields = { withCredentials: true };
    }

    return proxiedSync(method, model, options);
  };
})();
