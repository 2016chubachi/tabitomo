class CreateGuideBookingComments < ActiveRecord::Migration
  def change
    create_table :guide_booking_comments do |t|
      t.integer :guide_id
      t.string :comment
      t.integer :booking_id

      t.timestamps null: false
    end
  end
end
