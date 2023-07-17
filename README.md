# DB設計
## usersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| date_of_birth | date | null: false |

### Association
- has_many :items
- has_many :orders

## itemsテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| name | string | null: false |
| descritption | text | null: false |
| price | integer | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| shipping_charge_id | integer | null: false |
| shipping_date_id | integer | null: false |
| prefecture_id | integer | null: false |
| user(FK) | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
| Column | Type | Option |
|-|-|-|
| user | references | null: false |
| item | references | null: false |
| address | references | null: false |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addresssテーブル
| Column | Type | Option |
|-|-|-|
| post_code | string | null: false |
| prefecture_id | integer | null: false |
| municipality | string | null: false |
| address | string | null: false |
| building | string | null: false |
| telephone_number | string | null: false |
| purchase history | references | null: false, foreign_key: true|

### Association
- belongs_to :order