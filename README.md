# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| password               | string | null: false |
| password_confirmation  | string | null: false |
| last_name              | string | null: false |
| first_name             | string | null: false |
| last_name_kana         | string | null: false |
| first_name_kana        | string | null: false |
| birth_dath             | string | null: false |


- has_many :items
- has_many :orders

## items テーブル

| Column                     | Type       | Options           |
| --------------------------------------- | ----------------- |
| item_name                  | text       | null: false       |
| item_info                  | text       | null: false       |
| item_category              | string     | null: false       |
| item_sales_status          | string     | null: false       |
| item_shipping_fee_status   | string     | null: false       |
| item_prefecture            | string     | null: false       |
| item_scheduled_delovery    | string     | null: false       |
| item_price                 | strung     | null: false       |
| user                       | references | foreign_key: true |


- belongs_to :user
- has_one :orders


## orders テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| card_namber      | string     | null: false       |
| card_exp_month   | string     | null: false       |
| card_exp_year    | string     | null: false       |
| card_cvc         | string     | null: false       |
| postal_code      | string     | null: false       |
| prefecture       | string     | null: false       |
| city             | string     | null: false       |
| addresses        | string     | null: false       |
| building         | string     | null: false       |
| phone_number     | string     | null: false       |
| user             | references | foreign_key: true |
| item             | references | foreign_key: true |


- belongs_to :user
- belongs_to :item