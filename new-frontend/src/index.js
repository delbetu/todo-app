import _ from 'lodash'
import $ from 'jquery'
import Backbone from 'backbone'

function component() {
  const element = document.createElement('div');
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');
  return element;
}

document.body.appendChild(component());

$(document).ready(function() {
  Backbone.history.start();
});
