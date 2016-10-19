class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :status_master_id
      t.integer :traveler_id
      t.integer :guide_id
      t.string :traveler_first_name
      t.string :traveler_last_name
      t.string :traveler_email
      t.string :traveler_telphone
      t.string :traveler_country

      t.timestamps null: false
    end
  end
end
