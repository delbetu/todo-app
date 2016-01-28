this["JST"] = this["JST"] || {};

this["JST"]["app/templates/item.html.jst"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<li>\n  <div class="view">\n    <input class="toggle" type="checkbox" ' +
((__t = ( completed ? 'checked' : '' )) == null ? '' : __t) +
'>\n    <label>' +
((__t = ( title )) == null ? '' : __t) +
'</label>\n    <button class="destroy"></button>\n  </div>\n  <input class="edit" value="' +
((__t = ( title )) == null ? '' : __t) +
'">\n</li>\n';

}
return __p
};