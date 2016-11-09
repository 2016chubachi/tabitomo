class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.integer :member_id
      t.integer :experience
      t.date :birth_year
      t.string :profile
      t.string :guide_service
      t.string :guide_transportation
      t.string :guide_interest
      t.integer :license_flg

      t.timestamps null: false
    end
  end
end
