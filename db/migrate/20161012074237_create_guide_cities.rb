class CreateGuideCities < ActiveRecord::Migration
  def change
    create_table :guide_cities do |t|
      t.integer :guide_id
      t.integer :city_master_id

      t.timestamps null: false
    end
  end
end
