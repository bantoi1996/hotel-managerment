class RoomType < ApplicationRecord
  belongs_to :hotel
  has_many :rooms
end
