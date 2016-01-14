# Makers Academy Week 7 - Yelp Clone
This week's pairing project was a clone of Yelp. The goal was to introduce us to Rails, focusing especially on:

- Creating Rails applications
- The structure of Rails apps (MVC, the router, helpers)
- TDD in Rails, with RSpec & Capybara
- Associations
- Validations
- AJAX in Rails

## Usage
1. clone this repo
2. `bundle update`
3. `bundle install`
4. install postgresql
5. `createdb yelp_clone_development`
6. `rake db:migrate RAILS_ENV=development`
7. `rails s`
8. visit http://localhost:3000 in your browser

## Running tests
1. set up as above, then
2. `createdb yelp_clone_test`
3. `rake db:migrate RAILS_ENV=test`
4. `rspec`

## ToDo
Styling.
