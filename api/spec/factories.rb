
def user_with_group_and_items
  user = User.create!(name: 'John', email: 'user@todo.com', password: 'user')
  group_item = user.group_items.create!(list_title: 'Things to do')
  item = Item.create!(title: "Go to granny's home", completed: false, group_item_id: group_item.id)
  [user, group_item, item]
end

