class CreateBookingSchedules < ActiveRecord::Migration
  def change
    create_table :booking_schedules do |t|
      t.integer :booking_id
      t.integer :traveler_count
      t.integer :city_master_id
      t.datetime :traveler_date

      t.timestamps null: false
    end
  end
end
