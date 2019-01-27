class AddNumOfUsersToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :num_of_users, :integer
  end
end
