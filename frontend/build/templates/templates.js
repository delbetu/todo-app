this["JST"] = this["JST"] || {};

this["JST"]["app/templates/sample.html.jst"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<h1>Simmplest jst ever!</h1>\n\n';

}
return __p
};

this["JST"]["app/templates/users_list.html.jst"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape, __j = Array.prototype.join;
function print() { __p += __j.call(arguments, '') }
with (obj) {


    var length = userList.length;
    for (var index = 0; index < length; index++) {
        var user = userList[index];
;
__p += '\n        <tr>\n            <td>' +
((__t = ( index )) == null ? '' : __t) +
'</td>\n            <td>' +
((__t = ( user.firstName )) == null ? '' : __t) +
'</td>\n            <td>' +
((__t = ( user.lastName )) == null ? '' : __t) +
'</td>\n            <td>' +
((__t = ( user.email )) == null ? '' : __t) +
'</td>\n        </tr>\n';
 } ;
__p += '\n';

}
return __p
};