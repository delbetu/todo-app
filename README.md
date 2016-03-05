# Todo app

Simple frontend-backend application using backbone and rails 4 with grape.


##Pre-requisites
Have npm and ruby installed.
Have rails 4 and grunt-cli installed.

```bash
sudo npm install -g grunt-cli
```

## Build frontend

```bash
cd frontend
grunt build
grunt
```
Visit http://localhost:8000

## Build backend

```bash
cd backend
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
rails server
```

### API
Host localhost:3000
Every route is scoped under /api/v1
Every request must use content type application/json

#### Session
```
POST    /user_session
DELETE  /user_session
```
Authentication is meant to be from a browser since it is based on cookies.

Available users:
* admin@todo.com admin
* user@todo.com user

#### GroupItem
Attributes list_title, list_items
```
GET    /group_items
GET    /group_items/:id
POST   /group_items 
PUT    /group_items/:id
DELETE /group_items/:id
```

#### Items
Attributes title, completed
```
GET    /group_item/:group_id/items
GET    /group_item/:group_id/:id
POST   /group_item/:group_id/
PUT    /group_item/:group_id/:id
DELETE /group_item/:group_id/:id
```

## Pending tasks

### Frontend
* Refactor html
