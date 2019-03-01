class AddNumberUserToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :number_user, :integer
  end
end
