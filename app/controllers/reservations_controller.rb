class ReservationsController < ApplicationController

  skip_before_action :verify_authenticity_token
  def create
    byebug
    user_id = User.find_or_create_user(params[:user_details]).id
    hotel_id = Hotel.find_by(name: params[:hotel_name]).id
    table_id = HotelTable.avilable_tables(hotel_id, params[:num_of_users]).id
    @reservation = Reservation.create!(reservation_params.merge!(user_id: user_id, hotel_id: hotel_id, hotel_table_id: table_id))
    json_response(@reservation, :created)
  end

  private
  # We are getting parameters in the following format
  # {
  # 	"booking_date": "01/01/2019",
  # 	"booking_from": "19:00",
  # 	"booking_to": "18:00",
  # 	"hotel_name": "BBQ Nation",
  #   "user_details": {
  #     "email": "abc1@gmail.com",
  #   	"name": "test123",
  #   },
  # 	"num_of_users": 1
  # }
  def reservation_params
    params.require(:reservation).permit(:booking_date, :booking_from, :booking_to, :num_of_users)
  end
end
