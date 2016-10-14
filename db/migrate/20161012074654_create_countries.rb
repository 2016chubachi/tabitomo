class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :text_ja
      t.string :text_en
      t.string :text_ko
      t.string :text_zh

      t.timestamps null: false
    end
  end
end
