class HotelsController < ApplicationController

  before_action :set_hotel, only: [:show, :update, :destroy]

  def index
    @hotels = Hotel.all
    json_response(@hotels)
  end

  def create
    @hotel = Hotel.create!(hotel_params)
    json_response(@hotel, :created)
  end

  def show
    json_response(@hotel)
  end

  def update
    @hotel.update(hotel_params)
    head :no_content
  end

  def destroy
    @hotel.destroy
    head :no_content
  end

  private

  def hotel_params
    params.permit(:name, :email, :phone)
  end

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end
end
