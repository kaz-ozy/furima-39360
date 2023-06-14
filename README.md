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

| Column                | Type         | Options      |
| ------------------    | -------      | -----------  |
| nickname              | string       | null: false  |
| email                 | string       | unique: true |
| encrypted_password    | string       | null: false  |
| last_name             | string       | null: false  |
| first_name            | string       | null: false  |
| last_name_kana        | string       | null: false  | 
| first_name_kana       | string       | null: false  |
| birthday              | date         | null: false  |




### Association
has_many :items 
belongs_to :address
belongs_to :order

## items テーブル
<!-- 商品情報 -->

| Column                | Type         | Options     |
| ------------------    | -------      | ----------- |
| item_name             | string       | null: false |
| items_text            | text         | null: false |
| items_category        | string       | null: false |
| items_condition       | string       | null: false |
| selling_price         | string       | null: false |

<!-- item_name       =  アイテム名           -->
<!-- items_text      =  アイテムテキスト      -->
<!-- items_category  =  アイテムカテゴリー    -->
<!-- items_condition =  アイテムの状態       -->
<!-- selling_price   =  販売価格            -->

### Association
belongs_to :user
belongs_to :address
belongs_to :order


## addresses テーブル
<!-- 配送先住所 -->

| Column                | Type         | Options     |
| ------------------    | -------      | ----------- |
| item_image            | text         | null: false |
| prefectures           | string       | null: false |
| municipalities        | string       | null: false |
| address               | string       | null: false |
| building_name         | string       | null: false |
| telephone_number      | string     | null: false |

<!-- post_code         =  郵便番号    -->
<!-- prefectures       =  都道府県    -->
<!-- municipalities    =  市町村      -->
<!-- address           =  住所        -->
<!-- building_name     =  建物名      -->
<!-- telephone_number  =  電話番号     -->

### Association
belongs_to :user
belongs_to :item
belongs_to :order

## orders テーブル
<!--  購入記録 -->

| Column                | Type         | Options     |
| ------------------    | -------      | ----------- |
| user                  | references   | null: false |
| item                  | references   | null: false |

<!-- user          =  誰が買ったのか    -->
<!-- item  =  何を買った       -->
 belongs_to :user
 belongs_to :item
 belongs_to :address