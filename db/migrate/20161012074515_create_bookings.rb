class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :status_master_id
      t.integer :traveler_id
      t.integer :guide_id
      t.string :traveler_telphone

      t.timestamps null: false
    end
  end
end
