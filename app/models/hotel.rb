class Hotel < ApplicationRecord
  has_many :hotel_tables
  has_many :reservations
end
