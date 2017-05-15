# データベース設計

### users table
* deviseを使用して作成

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
* has_many :follow
***

### tweet table

| Column   | type   | Option |
|:--|:--|:---|
| text  | string | null: false, limit: 140 |
| image | string |  |
| user  | references | foreign_key: true, null: false |


**Association**
* belongs_to :user
* has_many :likes
* has_many :retweets
* acts_in_relation with: :follow
***

### follow table

| Column   | type   | Option |
|:--|:--|:---|
| user_id        | integer |  |
| target_user_id | integer |  |

**Association**
* acts_in_relation :action, source: :user, target: :user
***

## like table

| Column   | type   | Option |
|:--|:--|:---|
| user  | references | foreign_key: true, null: false |
| tweet | references | foreign_key: true, null: false |

**Association**
* belongs_to :user
* belongs_to :tweet
***

## retweet table

| Column   | type   | Option |
|:--|:--|:---|
| user  | references | foreign_key: true, null: false |
| tweet | references | foreign_key: true, null: false |

**Association**
* belongs_to :user
* belongs_to :tweet
***
