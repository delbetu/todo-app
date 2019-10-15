# Todo app

Single page application with frontend and backend implementation which allows creation of tasks and lists of tasks, along with destroying and mark them as completed.  

## Pre-requisites
* Node >= 8.16.1
* Ruby >= 2.5.7

## Build backend

```bash
cd backend
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
rails server
```

## Build frontend

```bash
cd frontend
npm install
npm run build
npm start
```

Visit http://localhost:8080

Available users:
* admin@todo.com admin
* user@todo.com user

## Used technologies
### Frontend
* Webpack
* Backbone
* Underscore
* Jquery

### Backend
* Rails 6 api
* JWT authentication
* Rspec

## Functionalities

User can login and organize their tasks into lists and items.  
A list of tasks is called `GroupItem`  
And a task is called `Item`  

A `User` has many `GroupItem` and  
A `GroupItem` has many `Items`

## Endpoints ( Curl examples )
| Description             | Rails-Endpoint                                         | Backbone call                 |
|-------------------------|--------------------------------------------------------|-------------------------------|
| Get auth token          | POST   /api/v1/user_session                            |ajax call                      |
| Fetch items for a group | GET    /api/v1/group_items/:group_item_id/items        |group-item-collection.fetch(); |
| Create item for a group | POST   /api/v1/group_items/:group_item_id/items        |group-item-collection.create();|
| Get item for a group    | GET    /api/v1/group_items/:group_item_id/items/:id    |item-model.fetch();            |
| Update item for a group | PUT    /api/v1/group_items/:group_item_id/items/:id    |item-model.save();             |
| Delete item             | DELETE /api/v1/group_items/:group_item_id/items/:id    |item-model.destroy();          |
| Get group item          | GET    /api/v1/group_items                             |item-collection.fetch();       |
| Create group item       | POST    /api/v1/group_items/                           |item-collection.create()       |
| Update group item       | PUT    /api/v1/group_items/:id                         |group-item-model.save();       |
| Delete group item       | DELETE /api/v1/group_items/:id                         |group-item-model.destroy();    |

### API
Every request must use content type application/json

#### Authorization
Get token for existing user from email and password.

```
curl -i -X POST \
     -H "Content-Type:application/x-www-form-urlencoded" \
     -d "user_session[email]=admin@todo.com" \
     -d "user_session[password]=admin" \
     'http://localhost:3000/api/v1/user_session'
```

#### GroupItem
Attributes list_title, list_items

```
curl -i -X GET \
 'http://localhost:3000/api/v1/group_items'

curl -i -X GET \
 'http://localhost:3000/api/v1/group_items/1'

curl -i -X POST \
   -H "Content-Type:application/json" \
   -d '{ "list_title" : "Job tasks" }' \
   'http://localhost:3000/api/v1/group_items'

curl -i -X PUT \
   -H "Content-Type:application/json" \
   -d '{ "list_title" : "Job Tasks"  }' \
   'http://localhost:3000/api/v1/group_items/1'

curl -i -X DELETE \
   -H "Content-Type:application/json" \
   'http://localhost:3000/api/v1/group_items/1'
```

#### Items
Attributes title, completed

```
curl -i -X GET \
 'http://localhost:3000/api/v1/group_items/3/items'

curl -i -X GET \
 'http://localhost:3000/api/v1/group_items/3/items/6'

curl -i -X POST \
   -H "Content-Type:application/json" \
   -d '{ "title": "Write integration tests"  }' \
   'http://localhost:3000/api/v1/group_items/3/items'

PUT    /group_item/:group_id/:id

curl -i -X PUT \
   -H "Content-Type:application/json" \
   -d '{ "title": "Write unit tests"  }' \
   'http://localhost:3000/api/v1/group_items/3/items'

curl -i -X DELETE \
   -H "Content-Type:application/json" \
   'http://localhost:3000/api/v1/group_items/3/items/6'
```

## Pending tasks

* Add start/stop button to task so you can track time of each task
* Remove already done tasks at the beginning of the day
* Add facebook authentication
* Add capistrano to allow deploying
* Refactor html + css
