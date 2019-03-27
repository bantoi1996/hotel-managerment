class Room < ApplicationRecord
  belongs_to :room_type
  has_many :comments
  validates :name, presence: true

  mount_uploader :image, ImageUploader
end
