class Hotel < ApplicationRecord
  has_many :hotel_tables
  has_many :reservations

  # Validations
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP, message: 'Only valid emails allowed'}, presence: true
  validates :phone, length: { in: 10..15 }, presence: true

  # Restaurants operate in shifts for example - Morning shift - 9 am to 1 pm, Evening shift - 6pm to 11 pm
  # Here we are considering time in 24Hrs format
  SHIFTS = {morning: "09:00".."13:00", evening: "18:00".."23:00"}
end
