class HotelsController < ApplicationController
  before_action :find_hotel_id, only: %i(edit show update destroy)

  def index
    @hotel = Hotel.all
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new hotel_params

    if @hotel.save
      redirect_to hotels_url
    else
      render :new
    end
  end

  def show; end

  def update
    if @hotel.update(hotel_params)
      redirect_to @hotel
    else
      render :edit
    end
  end

  def destroy
    if @hotel.destroy
      flash[:success] = t "hotel_delete"
      redirect_to hotels_url
    else
      flash[:danger] = t "delete_fail"
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit :name, :starLevel, :address, :description, :image
  end

  def find_hotel_id
    @hotel = Hotel.find_by id: params[:id]

    return if @hotel
    flash[:danger] = t "not_found"
    redirect_to root_url
  end
end
