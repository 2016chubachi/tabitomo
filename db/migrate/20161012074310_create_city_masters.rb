class CreateCityMasters < ActiveRecord::Migration
  def change
    create_table :city_masters do |t|
      t.string :text_ja
      t.string :text_en
      t.string :text_ko
      t.string :text_zh
      t.integer :display_order
      
      t.timestamps null: false
    end
  end
end
