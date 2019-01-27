class ReservationValidator < ActiveModel::Validator
  def validate(record)
    if record.no_of_customers < 2
      record.errors.add(:no_of_customers, "Min 2 customers are required for reservation")
    end
  end
end
