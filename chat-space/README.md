# DB設計
***
## tables
### users table
| column           | Type         | Options                                  |
|:-----------------|:-------------|:-----------------------------------------|
| name             | string       | index: true, null: false, unique: true   |
### Association
* has_many :groups, :through :groups_users
* has_many :messages
***
### groups table
| column           | Type         | Options                                  |
|:----------------:|:------------:|:----------------------------------------:|
| name             | string       | null: false, null: false                 |
| message_id       | references   | null: false, foreign_key: true           |
### Association
* has_many :users, :through :groups_users
* has_many :messages
***
### groups_users table
| column           | Type         | Options                                  |
|:----------------:|:------------:|:----------------------------------------:|
| user_id          | references   | null: false, foreign_key: true           |
| group_id         | references   | null: false, foreign_key: true           |
### Association
* belongs_to :users
* belongs_to :groups
***
### messages table
| column           | Type         | Options                                  |
|:----------------:|:------------:|:----------------------------------------:|
| text             | text         | null: false                              |
| user_id          | references   | null: false, foreign_key: true           |
### Association
* belongs_to :user
* belongs_to :group
