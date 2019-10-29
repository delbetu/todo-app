u1 = User.create!(name: 'Admin', email: 'admin@todo.com', password: 'admin')

g1 = u1.group_items.create!(list_title: "Work tasks")
g1.list_items.create!(title: "Pay bills",           completed: false)
g1.list_items.create!(title: "Talk with Ben",       completed: false)

g2 = u1.group_items.create!(list_title: "Home tasks")
g2.list_items.create!(title: "Do the dishes",       completed: false)
g2.list_items.create!(title: "Go to granny's home", completed: true)
g2.list_items.create!(title: "Cook a pie",          completed: false)


u2 = User.create!(name: 'Bruce', email: 'user@todo.com', password: 'user')

g1 = u2.group_items.create!(list_title: "Development tasks")
g1.list_items.create!(title: "Ask story clarification",            completed: true)
g1.list_items.create!(title: "Uderstand story",                    completed: true)
g1.list_items.create!(title: "Think about how affect the system",  completed: true)
g1.list_items.create!(title: "Make todo list to finish story",     completed: true)
g1.list_items.create!(title: "Develop and DevQA",                  completed: false)
g1.list_items.create!(title: "Apply tweaks after review",          completed: false)
g1.list_items.create!(title: "Deliver",                            completed: false)

g2 = u2.group_items.create!(list_title: "Trip planning")
g2.list_items.create!(title: "Hotels reservation",              completed: false)
g2.list_items.create!(title: "Check places to visit",           completed: true)
g2.list_items.create!(title: "Select and schedule activities",  completed: false)
