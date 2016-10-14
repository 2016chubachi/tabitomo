class CreateUserReviews < ActiveRecord::Migration
  def change
    create_table :user_reviews do |t|
      t.integer :star_count
      t.string :title
      t.string :detail
      t.integer :booking_id

      t.timestamps null: false
    end
  end
end
