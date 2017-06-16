# データベース設計

### users table
* gem 'devise' を使用

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

* has_many :likes, dependent: :destroy
* has_many :like_tweets, through: :likes, source: :tweet

* has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
* has_many :followings, through: :following_relationships

* has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
* has_many :followers, through: :follower_relationships
***

### tweets table

| Column   | type   | Option |
|:--|:--|:---|
| text  | string | null: false, limit: 140 |
| image | string |  |
| user  | references | foreign_key: true, null: false |


**Association**
* belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet

  # フォロー機能のアソシエーション
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships

  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
***

### Relationshiops table

| Column   | type   | Option |
|:--|:--|:---|
| following_id   | references | null: false, unique: true |
| follower_id_id | references | null: false, unique: true |

**Association**
* belongs_to :follower, class_name: "User"
* belongs_to :following, class_name: "User"
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

