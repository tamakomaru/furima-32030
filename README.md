## users テーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| last_name   | string | null: false |
| first_name  | string | null: false |
| last_kana   | string | null: false |
| first_kana  | string | null: false |
| birthday    | date   | null: false |

### Association

- has_many :items
- has_many :purchase_info

## items テーブル
| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| image               | text       | null: false |
| item_name           | string     | null: false |
| explanation         | text       | null: false |
| category            | integer    | null: false |
| condition           | integer    | null: false |
| shipping_charge     | integer    | null: false |
| prefectures         | integer    | null: false |
| purchase_to_day     | integer    | null: false |
| value               | integer    | null: false |
| user_id             | integer    | null: false, foreign_key: true | 


### Association

- belongs_to :user
- has_one :purchase_info
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_charge
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :purchase_to_day


## purchases_info テーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| item_id       | integer | null: false, foreign_key: true |
| user_id       | integer | null: false, foreign_key: true |
| purchase_date | date    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures_id| integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase_id   | integer    | null: false, foreign_key: true |
| purchase_info | integer    | null: false, foreign_key: true |

### Association

- has_one_active_hash :prefectures
- belongs_to :purchase_info