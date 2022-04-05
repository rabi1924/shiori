# README

## users テーブル

| Column             |  Type  | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique|
| encrypted_password | string | null: false |
| book               | string | 
| profile            |  text  | 

### Association

- has_many :memos
- has_many :comments

## memos テーブル

| Column |  Type  | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |
| goal   |  text  | null: false |
| action |  text  | 
| note   |  text  | 
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  |    Type    | Options                        |
| ------  | ---------- | ------------------------------ |
| content |    text    | null: false                    |
| memo    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |


### Association

- belongs_to :memo
- belongs_to :user