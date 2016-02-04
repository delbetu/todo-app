# Todo app

Simple frontend-backend application using backbone and rails.


## Build frontend

###Pre-requisites
npm
sudo npm install -g grunt-cli

```bash
cd frontend
grunt build
grunt connect (in new tab)
```
Visit http://localhost:8000

## Build backend

```bash
cd backend
bundle install
bundle exec rake db:migrate
rails server
```
