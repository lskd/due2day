
## What's due 2 day ?
___

due2day is a todo list app based on [Mckenzie Child's](http://mackenziechild.me/12-in-12/6/) todo list app
* check out [due2day](http://due2day2.herokuapp.com/) on Heroku
* ENV configuration via figaro gem
* postgres db for data

___
### install
```
git clone https://github.com/lskd/due2day.git ./due2day
cd due2day
rake bundle install
rake db:create rake db:migrate
rails s
within a firefox or chrome browser, goto localhost:3000
```
This will install locally.
To install on [heroku](https://devcenter.heroku.com/articles/getting-started-with-rails4) follow [these guidelines](https://devcenter.heroku.com/articles/getting-started-with-rails4)
___

_TODO_ :
* transition to Puma server
* incorporate soft deletes & undo options

___

Check out [Mckenzie Child's](http://mackenziechild.me/12-in-12/6/) todo list app.
* an excellent walk thru nested resources, forms, and CSS
