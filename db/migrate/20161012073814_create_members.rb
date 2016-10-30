class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.integer :country_id
      t.string :telphone
      t.integer :gender
      t.string :hantei

      t.timestamps null: false
    end
  end
end
