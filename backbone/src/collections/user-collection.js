import User from '../models/user-model.js'

let UserCollection = Backbone.Collection.extend({
  model: User,
  url: process.env.apiHost+'/api/v1/users',
});

export default UserCollection
