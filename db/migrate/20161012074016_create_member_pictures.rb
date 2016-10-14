class CreateMemberPictures < ActiveRecord::Migration
  def change
    create_table :member_pictures do |t|
      t.string :pictype
      t.binary :image
      t.integer :member_id

      t.timestamps null: false
    end
  end
end
