class Message < ApplicationRecord
  belongs_to :room
  mount_uploader :picture, PictureUploader
  default_scope  { order(created_at: :desc) }
end
