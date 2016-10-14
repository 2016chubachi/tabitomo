class CreateGuideLanguages < ActiveRecord::Migration
  def change
    create_table :guide_languages do |t|
      t.integer :guide_id
      t.integer :language_code_id
      t.integer :language_skill_id

      t.timestamps null: false
    end
  end
end
