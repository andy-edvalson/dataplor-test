# README

**Dataplor Take-home test app**

As of the initial commit, this is just a scaffolded rails API, built using ``docker-compose run web rails new . --force --no-deps --database=postgresql --api``

Quick Start:

docker-compose build

docker-compose run web rake db:create

docker-compose run rake db:migrate

docker-compose run rake db:seed

docker-compose up

---

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
