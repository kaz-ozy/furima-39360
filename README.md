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
<!-- ユーザー管理機能 -->

| Column                | Type         | Options     |
| ------------------    | -------      | ----------- |
| nickname              | string       | null: false |
| email                 | string       | null: false |
| encrypted_password    | string       | null: false |
| last-name             | string       | null: false |
| first-name            | string       | null: false |
| last-name-kana        | string       | null: false | 
| first-name-kana       | string       | null: false |
| year                  | string       | null: false |
| month                 | string       | null: false |
| days                  | string       | null: false |


### Association
has_many :product_information
belongs_to :enter_delivery_address
belongs_to :purchase_record

## product_information テーブル
<!-- 商品情報 -->

| Column                | Type         | Options     |
| ------------------    | -------      | ----------- |
| item_image            | text         | null: false |
| item_name             | string       | null: false |
| items_text            | text         | null: false |
| items_category        | string       | null: false |
| items_condition       | string       | null: false |
| selling_price         | string       | null: false |

<!-- items_text      =  アイテムテキスト      -->
<!-- items_category  =  アイテムカテゴリー    -->
<!-- items_condition =  アイテムの状態       -->
<!-- selling_price   =  販売価格            -->

### Association
belongs_to :users
belongs_to :purchase_record
belongs_to :enter_delivery_address

## enter_delivery_address
<!-- 配送先住所 -->

| Column                | Type         | Options     |
| ------------------    | -------      | ----------- |
| item_image            | text         | null: false |
| post_code             | string       | null: false |
| prefectures           | string       | null: false |
| municipalities        | string       | null: false |
| address               | string       | null: false |
| building_name         | string       | null: false |
| telephone_number      | integer      | null: false |

<!-- post_code      =  郵便番号    -->
<!-- prefectures    =  都道府県    -->
<!-- municipalities =  市町村      -->
<!-- address        =  住所        -->
<!-- building_name  =  建物名      -->

### Association
belongs_to :users
belongs_to :product_information
belongs_to :purchase_record

## purchase_record
<!--  購入記録 -->

| Column                | Type         | Options     |
| ------------------    | -------      | ----------- |
| who_buys              | text         | null: false |
| what_did_you_buy      | text         | null: false |

<!-- who_buys          =  誰が買ったのか    -->
<!-- what_did_you_buy  =  何を買った       -->
 belongs_to :users
 belongs_to :product_information
 belongs_to :enter_delivery_address