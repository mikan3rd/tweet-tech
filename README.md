# データベース設計

### users table
* gem 'devise' を使用
* gem 'acts_in_relation' を使用

| Column   | type   | Option |
|:--|:--|:---|
| nickname     | string | null: false, unique: true |
| username     | string | null: false, unique: true |
| mail         | string | null: false, unipue: true |
| introduction | string |  |
| icon         | string |  |
| wallpaper    | string |  |

**Association**
* has_many :tweets
* has_many :likes
* has_many :retweets
* acts_in_relation with: :follow
***

### tweets table

| Column   | type   | Option |
|:--|:--|:---|
| text  | string | null: false, limit: 140 |
| image | string |  |
| user  | references | foreign_key: true, null: false |


**Association**
* belongs_to :user
* has_many :likes
* has_many :retweets
***

### follows table
* gem 'acts_in_relation' を使用

| Column   | type   | Option |
|:--|:--|:---|
| user_id        | integer |  |
| target_user_id | integer |  |

**Association**
* acts_in_relation :action, source: :user, target: :user
***

## likes table

| Column   | type   | Option |
|:--|:--|:---|
| user  | references | foreign_key: true, null: false |
| tweet | references | foreign_key: true, null: false |

**Association**
* belongs_to :user
* belongs_to :tweet
***

## retweets table

| Column   | type   | Option |
|:--|:--|:---|
| user  | references | foreign_key: true, null: false |
| tweet | references | foreign_key: true, null: false |

**Association**
* belongs_to :user
* belongs_to :tweet
***
