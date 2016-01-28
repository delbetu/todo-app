$(function() {
  var sampleTemplate = window.JST["app/templates/sample.html.jst"]();
  $("#content").html(sampleTemplate);

  var usersData = [
    {
      firstName: 'Mark',
      lastName: 'Otto',
      email: 'mark@example.com'
    },
    {
      firstName: 'Jacob',
      lastName: 'Thornton',
      email: 'jacob@example.com'
    },
    {
      firstName: 'Larry',
      lastName: 'Bird',
      email: 'lary@example.com'
    }
  ];

  var usersListTemplate = window.JST["app/templates/users_list.html.jst"]({ userList: usersData });
  $("#content2").html(usersListTemplate);
});
