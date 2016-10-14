class CreateBookingComments < ActiveRecord::Migration
  def change
    create_table :booking_comments do |t|
      t.integer :member_id
      t.string :comment
      t.integer :booking_id

      t.timestamps null: false
    end
  end
end
