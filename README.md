# README

Warning, this application could contain material unsuitable for some audiences.  Viewer discretion is advised.

About:

Palpit8 is a clone of Twitch.tv that analyzes chatroom data of gamer streams through the Watson Tone Analyzer and returns real-time visualization of the mood of a chatroom.

**The mood visualization is currently not working on Heroku. Project currently being migrated to AWS to fix this problem by implementing S3.**

This project was created by a team of 5 student over a period of two weeks. Major contributions were as follows:
[JF Lalonde](https://github.com/JF-Lalonde)

## Environment Setup:

* Ruby 2.4.1

* Rails 5.1.3

* Redis

* Sidekiq

* RSpec/Capybara/Shoulda-matchers

### How to get everything running:

* Clone down the project and `bundle`

* In order to get the Redis server running `brew install redis`
* Once Redis is installed, use `redis-server` to boot it up

* Once Redis is started, initiate Sidekiq jobs with `bundle exec sidekiq`

* `rails s` to start the Rails server

* Visit localhost:3000

### Testing Suite

* In order to run testing, simply type `rspec` in the terminal
