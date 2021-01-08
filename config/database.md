# Database sheet

## tb_user

|      |   id    | username | email  | password_digest | grant_id | created_at | updated_at |
| :--: | :-----: | :------: | :----: | :-------------: | :------: | :--------: | :--------: |
| type | integer |  string  | string |     string      | integer  |  datetime  |  datetime  |

User.create(username: "1", ?> email: "123@123", password_digest: "1",grant_id: "2")

> **relation**
>
> tb_user.id (1=1) tb_user_information.user_id
>
> tb_user.grant_id (n=1) tb_grant.id
>
> tb_user.id (1=n) tb_score_result.user_id
>
> tb_user.id (1=n) tb_file_upload.user_id

## tb_user_information

|      |   id    | user_id | nickname | school | ...  | created_at | updated_at |
| :--: | :-----: | :-----: | :------: | :----: | :--: | :--------: | :--------: |
| type | integer | integer |  string  | string | ...  |  datetime  |  datetime  |

> **relation**
>
> tb_user_information.user_id (1=1) tb_user.id

## tb_grant

|      |   id    | group_name | sys_admin | sys_read | sys_download | sys_upload | ...  | created_at | updated_at |
| :--: | :-----: | :--------: | :-------: | :------: | :----------: | :--------: | :--: | :--------: | :--------: |
| note |         |            |  管理员   |   查看   |   下载文件   |  上传文件  |      |            |            |
| type | integer |   string   |   bool    |   bool   |     bool     |    bool    | ...  |  datetime  |  datetime  |

Grant.create(id: "2", group_name: "1", ?> sysadmin: "false", sys_read: "false",sys_download: "false",sys_upload:"false")

> **relation**
>
> tb_grant.id (1=n) tb_user.grant_id

## tb_score_result

|      |   id    | user_id | score_base_id | score_origin | score_result | created_at | updated_at |
| :--: | :-----: | :-----: | :-----------: | :----------: | :----------: | :--------: | :--------: |
| type | integer | integer |    integer    |   integer    |    float     |  datetime  |  datetime  |

> **relation**
>
> tb_score_result.user_id (n=1) tb_user.id
>
> tb_score_result.score_base_id (n=1) tb_score_base.id

## tb_score_base

|      |   id    | base_name | base_score | weight | created_at | updated_at |
| :--: | :-----: | :-------: | :--------: | :----: | :--------: | :--------: |
| type | integer |  string   |  integer   | float  |  datetime  |  datetime  |

> **relation**
>
> tb_score_base.id (1=n) tb_score_result.score_base_id

## tb_file_upload

|      |   id    | user_id | file_size | file_name | file_md5 | created_at | updated_at |
| :--: | :-----: | :-----: | :-------: | :-------: | :------: | :--------: | :--------: |
| type | integer | integer |   long    |  string   |  string  |  datetime  |  datetime  |

> **relation**
>
> tb_file_upload.user_id (n=1) tb_user.id