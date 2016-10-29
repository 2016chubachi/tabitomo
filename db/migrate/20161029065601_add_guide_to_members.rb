class AddGuideToMembers < ActiveRecord::Migration
  def change
    add_column :members, :guide, :boolean
  end
end
