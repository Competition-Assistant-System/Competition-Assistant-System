# Database sheet

## tb_user

|  | id | username | email | password_digest | group | created_at | updated_at |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| | integer | string | string | string | integer | datetime | datetime |

> relation
>
> tb_user.id (1=1) tb_user_information.user_id
>
> tb_user.group (n=1) tb_grant.id
>
> tb_user.id (1=n) tb_file_upload.user_id

## tb_user_information

|  | id | user_id | nickname | school | ... | created_at | updated_at |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| | integer | integer | string | string | ... | datetime | datetime |

> relation
>
> tb_user_information.user_id (1=1) tb_user.id

## tb_grant

|  | id | group_name | sys_admin | sys_read | sys_download | sys_upload | ... | created_at | updated_at |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| | | |admin?| | | | | |
| | integer | string | bool | bool | bool | bool | ... | datetime | datetime |

> relation
>
> tb_grant.id (1=n) tb_user.group

## tb_score_result

|  | id | user_id | score_type | score_origin | score_result | created_at | updated_at |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| | integer | integer | integer | integer | integer | datetime | datetime |

> relation
>
> tb_score_result.user_id (n=1) tb_user.id
>
> tb_score_result.score_type (n=1) tb_score_base.id

## tb_score_base

|  | id | base_name | base_score | weight | created_at | updated_at |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| | integer | string | integer | float | datetime | datetime |

> relation
>
> tb_score_base.id (1=n) tb_score_result.score_type

## tb_file_upload

|  | id | user_id | file_size | file_path | created_at | updated_at |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| | integer | integer | string | string | datetime | datetime |

> relation
>
> tb_file_upload.user_id (n=1) tb_user.id