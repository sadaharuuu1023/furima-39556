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
- belongs_to :order

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
- belongs_to :order

## ordersテーブル
| Column | Type | Option |
|-|-|-|
| user_id | references | null: false |
| item_id | references | null: false |
| address_id | references | null: false |

### Association
- has_many :items
- has_many :users
- belongs_to :address

## addresssテーブル
| Column | Type | Option |
|-|-|-|
| post_code | integer | null: false |
| prefecture_id | string | null: false |
| municipality_id | string | null: false |
| address | integer | null: false |
| building | string | null: false |
| telephone_number | integer | null: false |

### Association
- belongs_to :order