import User from '../models/user-model.js'

let UserCollection = Backbone.Collection.extend({
  model: User,
  url: process.env.apiHost+'/api/v1/users',
  add: function creationSuccessCallback(response) {
    console.log('User successfully Created!')
  },
  error: function creationErrorCallback(response) {
    console.log('Error creating User: ' + response.responseJSON.errors[0])
  }
});

export default UserCollection
