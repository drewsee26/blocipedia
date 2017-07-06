# Blocipedia
## A Ruby on Rails Wiki style application to collaborate with other users.

Blocipedia allows users to sign up for a free account to post public Wikis
* This app is deployed on Heroku: https://still-spire-75145.herokuapp.com/
* The source code is located on github: https://github.com/drewsee26/blocipedia

## Features
* Uses Devise gem for authentication and profile management.
* Allows paid premium users to post private content and add collaborators on their Wikis.
* Allows all users to edit other user's Wikis.
* Employs Redcarpet gem to add markdown capabilities

## Configuration and Setup
**Ruby version 2.3.0 - Rails version 4.2.7**

**Gems used:**
```
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
 
group :development do
   gem 'sqlite3'
   gem 'web-console', '~> 2.0'
end
 
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap'
gem 'figaro', '1.0'
gem 'devise'
gem 'pundit'
gem 'stripe'
gem 'bootstrap-sass'
gem 'redcarpet'

group :development, :test do
  gem 'byebug'
  gem 'spring'
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'pry-rails'
end
```

## Setup
* Environmental variables were secured using Figaro and are stored in config/application.yml (ignored by github)
* The config/application.example.yml illustrates the formatting for environmental variables.

## To run Blocipedia locally
* Clone the repository
* Run bundle install
* Create and migrate the SQLite database with rake db:create and rake db:migrate
* Start the server using rails s
* Run the app on localhost:3000



