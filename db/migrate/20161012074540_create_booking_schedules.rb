class CreateBookingSchedules < ActiveRecord::Migration
  def change
    create_table :booking_schedules do |t|
      t.integer :booking_id
      t.integer :traveler_count
      t.string :traveler_location
      t.datetime :traveler_date

      t.timestamps null: false
    end
  end
end
