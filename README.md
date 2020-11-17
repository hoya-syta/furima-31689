# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| email                 | string | null: false |
| password              | string | null: false |
| nickname              | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_hurigana    | string | null: false |
| first_name_hurigana   | string | null: false |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| item_explain  | text       | null: false                    |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| delivery_zone | integer    | null: false                    |
| delivery_time | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one   :purchase



## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| when   | datetime   | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :address



##　addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal code    | string  | null: false |
| prefectures    | string  | null: false |
| municipalities | string  | null: false |
| address        | string  | null: false |
| phone number   | integer | null: false |

### Association

- hus_one :purchases
