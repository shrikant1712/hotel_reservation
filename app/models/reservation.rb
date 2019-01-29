class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :hotel_table
  attr_accessor :hotel_name, :user_details, :reservation
  validates_with HotelValidator
  after_create :update_table_booking_status

  private
  def update_table_booking_status
    hotel_table.update(booked: true)
  end
end
