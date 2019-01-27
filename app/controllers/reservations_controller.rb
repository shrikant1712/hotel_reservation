class ReservationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    user = User.find_or_create_user(params[:user_details])
    hotel = Hotel.find_by(name: params[:hotel_name])
    return json_response({ message: "Please check provided hotel details" }) if !hotel
    table = HotelTable.avilable_tables(hotel.id, params[:num_of_users])
    if table
      @response = Reservation.create!(reservation_params.merge!(
        user_id: user.id, hotel_id: hotel.id, hotel_table_id: table.id))
      ReservationMailer.reservation_confirm_email(@response).deliver
      return json_response(@response, :created)
    else
      return json_response({ message: "All tables are already booked for #{params[:booking_date]}" })
    end
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
  # 	"num_of_users": 1m
  # shift_type: "evening"
  # }
  def reservation_params
    params.require(:reservation).permit(:booking_date, :booking_from, :booking_to, :num_of_users, :shift_type)
  end
end
