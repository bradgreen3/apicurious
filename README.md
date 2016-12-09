### APIcurious

APIcurious consumes the GitHub API in order to recreate a simplified version
of GitHub's website. Users are authenticated with GitHub using OAuth. Once
authenticated, users can view their repositories, starred repositories,
organizations they are affiliated with, recent commits, the number of users
following them, the number of users they are following and recent activity of
users they are following. Testing was completed using RSpec and Capybara.

### Version

* Ruby: 2.3.0
* Rails: 5.0.0.1

### Setup

* git clone https://github.com/bradgreen3/apicurious.git
* bundle
* rake db:create db:migrate
* rails s
* visit localhost:3000

### Run Test Suite

* rspec
