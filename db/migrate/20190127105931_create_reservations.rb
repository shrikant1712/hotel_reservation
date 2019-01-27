class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.belongs_to :user
      t.belongs_to :hotel
      t.belongs_to :hotel_table
      t.date :booking_date
    	t.time :booking_from
    	t.time :booking_to
      t.timestamps
    end
  end
end
