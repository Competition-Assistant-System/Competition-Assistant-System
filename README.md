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
6. run `docker-compose run web rake db:seed`.
7. Congratulation!

> NOTE: after run `docker-compose run web rails db:create`, it will take some time to complie webpack.



## Routing

`/admin/base_score` 管理员基础分数管理

`/admin/file_manager` 管理员提交文件管理

`/submit_files` 用户文件提交

`/score_ranking`  榜单

`/users` 用户管理