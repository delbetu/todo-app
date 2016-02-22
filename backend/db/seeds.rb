# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'admin@todo.com', password: 'admin')

g1 = GroupItem.create(list_title: "Work tasks")
g1.list_items.create(title: "Pay bills",           completed: false)
g1.list_items.create(title: "Talk with Ben",       completed: false)

g2 = GroupItem.create(list_title: "Home tasks")
g2.list_items.create(title: "Do the dishes",       completed: false)
g2.list_items.create(title: "Go to granny's home", completed: true)
g2.list_items.create(title: "Cook a pie",          completed: false)
