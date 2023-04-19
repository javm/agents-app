# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

ruby 3.0.3p157

* Rails version

Rails 7.0.4.3

* System dependencies

* Configuration
Check on env_example file

* Database creation
- Create a postgrsql database named as

'agents_app_development'

with

user: agentsapp

* Database initialization

rails db:migrate RAILS_ENV=development

rails db:seed RAILS_ENV=development

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

bundle install

* Roadmap to test the endpoints

- Create a call
curl --request POST \
  --url http://localhost:3000/calls \
  --header 'Content-Type: application/json' \
  --data '{
	"call_type": "inbound",
	"account_id": 2,
	"agent_id": 1,
	"caller_phone_number": "(954) 123-4567",
	"receiver_phone_number": "(954) 121-4321"
}'