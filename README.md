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
| nickname           | string | null: false, unique: true|
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :orders
- has_many :cards

## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ------     | -----------                    |
| item_name            | string     | null: false                    |
| item_description     | text       | null: false                    |
| category             | text       | null: false                    |
| condition            | text       | null: false                    |
| shipping_charges     | text       | null: false                    |
| shipper_area         | text       | null: false                    |
| days_to_ship         | text       | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :orders

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefectures      | text       | null: false                    |
| municipalities   | text       | null: false                    |
| condition        | text       | null: false                    |
| address          | text       | null: false                    |
| building_name    | text       | null: false                    |
| telephone_number | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :cards
- belongs_to :items

## cards テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| customer_token   | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :orders

