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
| shipping_charge_id   | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| days_to_ship_id      | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column              | Type       | Options                        |
| ----------------    | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| municipalities      | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| telephone_number    | string     | null: false                    |
| purchase_history    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history

## purchase_history テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |


### Association

- has_one :order

