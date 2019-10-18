import GroupItem from '../models/group-item-model.js'

let GroupItemCollection = Backbone.Collection.extend({
  model: GroupItem,
  url: process.env.apiHost+'/api/v1/group_items'
});

export default GroupItemCollection
