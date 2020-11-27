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

## How to use the Docker

1. check `dockerfile`, `docker-compose.yml`, `entrypoint.sh`.
2. run `docker-compose build`.
3. run `docker-compose up`.
4. run `docker-compose run web rails db:create`.
5. run `docker-compose run web rake db:migrate`.
6. Congratulation!

> NOTE: after run `docker-compose run web rails db:create`, it will take some time to complie webpack.
