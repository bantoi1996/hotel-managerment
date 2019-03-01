class Hotel < ApplicationRecord
  has_many :room_types
  validates :name, presence: true
  validates :starLevel, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
