# テーブル設計

## users テーブル

| Column                | Type     | Options     |
| --------------------- | -------- | ----------- |
| email                 | string   | null: false |
| encrypted_password    | string   | null: false |
| nickname              | string   | null: false |
| last_name             | string   | null: false |
| first_name            | string   | null: false |
| last_name_hurigana    | string   | null: false |
| first_name_hurigana   | string   | null: false |
| birthday              | datetime | null: false |


### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| item_explain     | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| delivery_zone_id | integer    | null: false                    |
| delivery_time_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one   :purchase



## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :address



## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| house_number   | string     | null: false                    |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- hus_one :purchases
