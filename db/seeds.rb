#データを作成したいテーブルの名称を記述
#データの作成は以下のファイルに作成
#db/seeds/環境(development, production)/テーブル名称.rb
#
table_names = %w(language_skills status_masters)

table_names.each do |table_name|
  path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}..."
    require path
  end
end