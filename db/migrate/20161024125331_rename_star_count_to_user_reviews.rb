class RenameStarCountToUserReviews < ActiveRecord::Migration
  def change
    rename_column :user_reviews, :star_count, :star_master_id
  end
end
