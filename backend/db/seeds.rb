# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'admin@todo.com', password: 'admin')

Item.create(title: "Go to granny's home", completed: true)
Item.create(title: "Do the dishes", completed: false)
Item.create(title: "Pay bills", completed: false)

GroupItem.create(list_title: "Work tasks")
GroupItem.create(list_title: "Home tasks")
