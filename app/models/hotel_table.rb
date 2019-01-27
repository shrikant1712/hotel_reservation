class HotelTable < ApplicationRecord
  has_many :reservations
  belongs_to :hotel

  def self.avilable_tables(hotel_id, num_of_users)
    byebug
    HotelTable.find_by(hotel_id: hotel_id, booked: false)
  end
end
