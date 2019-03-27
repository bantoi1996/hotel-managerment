class ShowRoomController < ApplicationController
  def index
    @id_hotel = params[:id]
    @room = Room.where(hotel_id: @id_hotel)
    # @room = Room.all

  end
end
