class ChangeDatatypeBirthYearOfGuides < ActiveRecord::Migration
  def change
    # [形式] change_column(テーブル名, カラム名, データタイプ, オプション)
    change_column :guides, :birth_year, :date
  end
end
