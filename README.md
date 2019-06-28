# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Deployment Notes

see .ebextensions for permissions set up
eb setenv NODE_ENV=production 
eb setenv RAILS_MASTER_KEY=XXX
eb setenv RAILS_SERVE_STATIC_FILES=true 
