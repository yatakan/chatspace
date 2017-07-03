class Group < ApplicationRecord
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :messages

  def last_message_search
    @messages = self.messages
    @last_message = @messages.last
    @text = @last_message.text
    return @text
  end
end
