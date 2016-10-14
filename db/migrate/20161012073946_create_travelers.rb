class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.integer :member_id

      t.timestamps null: false
    end
  end
end
