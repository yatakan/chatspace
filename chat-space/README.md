# DB設計
***
## tables
### users table
| column           | Type         | Options                                  |
|:-----------------|:-------------|:-----------------------------------------|
| name             | string       | index: true, null: false, unique: true   |
### Association
* has_many :groups, :through :members
* has_many :messages
* belongs_to :member
***
### groups table
| column           | Type         | Options                                  |
|:----------------:|:------------:|:----------------------------------------:|
| name             | string       | null: false, null: false                 |
| message_id       | references   | null: false, foreign_key: true           |
### Association
* has_many :users, :through :members
* has_many :messages
* belongs_to :member
***
### members table
| column           | Type         | Options                                  |
|:----------------:|:------------:|:----------------------------------------:|
| user_id          | references   | null: false, foreign_key: true           |
| group_id         | references   | null: false, foreign_key: true           |
### Association
* has_many :users
* has_many :groups
***
### messages table
| column           | Type         | Options                                  |
|:----------------:|:------------:|:----------------------------------------:|
| text             | text         | null: false                              |
| user_id          | references   | null: false, foreign_key: true           |
### Association
*belongs_to :user
*belongs_to :group
