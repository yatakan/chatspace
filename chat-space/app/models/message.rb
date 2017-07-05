class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :text, presence: true, if:"image.blank?"
  validates :group_id, :user_id, presence: true
  mount_uploader :image, ImageUploader
end
