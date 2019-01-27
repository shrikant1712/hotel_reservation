class HotelValidator < ActiveModel::Validator
  def validate(record)
    if !is_in_time_range(record)
      record.errors.add(:booking_from, "Restaurants operate in shifts. Morning shift - 9 am to 1 pm, Evening shift - 6pm to 11 pm")
    end
  end

  private
  def is_in_time_range(record)
    booking_from = record.booking_from.strftime("%H:%M")
    booking_to = record.booking_to.strftime("%H:%M")
    # Check whether shift time is present in the Hotel time frame
    Hotel::SHIFTS[record.shift_type.to_sym].cover?(booking_from) && Hotel::SHIFTS[record.shift_type.to_sym].cover?(booking_to)
  end
end
