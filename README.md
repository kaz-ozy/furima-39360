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

| Column                | Type         | Options                   |
| -----------------     | -------      | ------------------------  |
| nickname              | string       | null: false               |
| email                 | string       | null: false ,unique: true |
| encrypted_password    | string       | null: false               |
| last_name             | string       | null: false               |
| first_name            | string       | null: false               |
| last_name_kana        | string       | null: false               | 
| first_name_kana       | string       | null: false               |
| birthday              | date         | null: false               |

<!-- nickname            = ニックネーム  -->
<!-- email               = eメール      -->
<!-- encrypted_password  = パスワード    -->
<!-- last_name           = 名字         -->
<!-- first_name          = 名前         -->
<!-- last_name_kana      = 名字カタカナ   -->
<!-- first_name_kana     =  名前カナ      -->

### Association
has_many :items 

has_many :orders

## items テーブル
<!-- 商品情報 -->

| Column                | Type         | Options                        |
| ------------------    | -------      | -----------                    |
| name                  | string       | null: false                    |
| explanation           | text         | null: false                    |
| category_id           | integer      | null: false                    |
| condition_id          | integer      | null: false                    |
| price                 | integer      | null: false                    |
| charge_id             | integer      | null: false                    |
| prefecture_id         | integer      | null: false                    |
| days_ship_id          | integer      | null: false                    |
| seller                | integer      | null: false                    |
| user                  | references   | null: false ,foreign_key: true |

<!-- name           =  アイテム名          -->
<!-- explanation    =  アイテムテキスト     -->
<!-- category       =  アイテムカテゴリー   -->
<!-- condition      =  アイテムの状態      -->
<!-- price          =  販売価格           -->
<!-- charge         =  配送料の負担        -->
<!-- prefecture     =  発送元の地域        -->
<!-- days_ship      =  発送までの日数       -->
<!-- seller         =  出品者              -->

### Association
belongs_to :user

has_one :order


## addresses テーブル
<!-- 配送先住所 -->

| Column                | Type         | Options                        |
| ------------------    | -------      | -----------                    |
| post_code             | string       | null: false                    |
| prefecture_id         | integer      | null: false                    |
| municipalitie         | string       | null: false                    |
| address               | string       | null: false                    |
| building_name         | string       |                                |
| telephone_number      | string       | null: false                    |
| order                 | references   | null: false ,foreign_key: true |

<!-- post_code         =  郵便番号    -->
<!-- prefecture       =  都道府県    -->
<!-- municipalitie    =  市町村      -->
<!-- address           =  住所        -->
<!-- building_name     =  建物名      -->
<!-- telephone_number  =  電話番号     -->

### Association
belongs_to :order


## orders テーブル
<!--  購入記録 -->

| Column                | Type         | Options                        |
| ------------------    | -------      | -----------                    |
| user                  | references   | null: false ,foreign_key: true |
| item                  | references   | null: false ,foreign_key: true |

<!-- user          =  誰が買ったのか    -->
<!-- item          =  何を買った       -->
 belongs_to :user
 belongs_to :item
 has_one :address

 

