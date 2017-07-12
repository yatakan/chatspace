class Group < ApplicationRecord
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :messages
  validates :name, presence: true

  def last_message_search
    messages.last.text
  end
end
