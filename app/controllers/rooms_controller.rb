class RoomsController < ApplicationController
  before_action :find_room_id, only: %i(edit show update destroy)

  def index
    @room = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new room_params

    if @room.save
      redirect_to rooms_url
    else
      render :new
    end
  end

  def show; end

  def update
    if @room.update(room_params)
      redirect_to @room
    else
      render :edit
    end
  end

  def destroy
    if @room.destroy
      flash[:success] = t "room_delete"
      redirect_to rooms_url
    else
      flash[:danger] = t "delete_fail"
    end
  end

  private

  def room_params
    params.require(:room).permit :name, :hotel_id, :status, :room_type_id, :description, :image
  end

  def find_room_id
    @room = Room.find_by id: params[:id]

    return if @room
    flash[:danger] = t "not_found"
    redirect_to root_url
  end
end
