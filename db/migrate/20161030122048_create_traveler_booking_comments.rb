class CreateTravelerBookingComments < ActiveRecord::Migration
  def change
    create_table :traveler_booking_comments do |t|
      t.integer :traveler_id
      t.string :comment
      t.integer :booking_id

      t.timestamps null: false
    end
  end
end
