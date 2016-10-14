class CreateLicencePictures < ActiveRecord::Migration
  def change
    create_table :licence_pictures do |t|
      t.string :pictype
      t.binary :image
      t.integer :guide_id

      t.timestamps null: false
    end
  end
end
