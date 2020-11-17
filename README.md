# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| email                 | string | null: false |
| password              | string | null: false |
| nickname              | string | null: false |
| last name             | string | null: false |
| first name            | string | null: false |
| last name hurigana    | string | null: false |
| first name hurigana   | string | null: false |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item name     | string     | null: false                    |
| item explain  | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| delivery fee  | integer    | null: false                    |
| delivery zone | string     | null: false                    |
| delivery time | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :purchases



## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| when   | datetime   | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- hus_one :addresses



##　addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal code    | string  | null: false |
| prefectures    | string  | null: false |
| municipalities | text    | null: false |
| address        | text    | null: false |
| phone number   | integer | null: false |

### Association

- hus_one :purchases
