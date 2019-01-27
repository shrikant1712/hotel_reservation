class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :hotel_table

  attr_accessor :hotel_name, :user_details, :reservation
end
