import _ from 'lodash'
import $ from 'jquery'
import Backbone from 'backbone'
import coso from './demo.html'

function component() {
  const element = document.createElement('div');
  // element.innerHTML = _.join(['Hello', 'webpack'], ' ');
  let template = require("./templates/item.html")
  let content2 = _.template(template)({title: 'sldfds', completed: true})

  element.innerHTML = content2

  return element;
}

document.body.appendChild(component());

$(document).ready(function() {
  Backbone.history.start();
});
