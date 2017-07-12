class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :text, presence: true, unless:"image?"
  validates :group_id, :user_id, presence: true
  validates :user, presence: true
  mount_uploader :image, ImageUploader

  def date_time
    date_time = created_at.strftime("%Y/%m/%d %H:%M")
    return date_time
  end
end
