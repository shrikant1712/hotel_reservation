class CreateHotelTables < ActiveRecord::Migration[5.2]
  def change
    create_table :hotel_tables do |t|
      t.belongs_to :hotel
      t.string :name
      t.integer :min_seats
      t.integer :max_seats
      t.boolean :booked, default: false
      t.timestamps
    end
  end
end
