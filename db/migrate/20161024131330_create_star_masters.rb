class CreateStarMasters < ActiveRecord::Migration
  def change
    create_table :star_masters do |t|
      t.string :pictype
      t.binary :image

      t.timestamps null: false
    end
  end
end
