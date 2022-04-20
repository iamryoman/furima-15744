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
# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ------     | -----------                    |
| item_name            | string     | null: false                    |
| item_description     | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| shipping_charges_id  | integer    | null: false                    |
| prefectures_id       | integer    | null: false                    |
| days_to_ship_id      | integer    | null: false                    |
| price                | integer    | null: false                    |
| user_id              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column              | Type       | Options                        |
| ----------------    | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefectures         | text       | null: false                    |
| municipalities      | text       | null: false                    |
| address             | text       | null: false                    |
| building_name       | text       | null: false                    |
| telephone_number    | string     | null: false                    |
| purchase_history_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchase_history テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item

