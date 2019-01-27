class AddShiftTypeToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :shift_type, :string
  end
end
