class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.integer :country_id
      t.string :telphone
      t.integer :gender

      t.timestamps null: false
    end
  end
end
