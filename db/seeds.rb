#データを作成したいテーブルの名称を記述
#データの作成は以下のファイルに作成
#db/seeds/環境(development, production)/テーブル名称.rb
table_names = %w(booking_schedules bookings city_masters countries  guide_booking_comments guide_cities guide_languages guides language_codes language_skills members member_pictures messages star_masters status_masters travelers traveler_booking_comments user_reviews)
# table_names = %w(traveler_booking_comments)

table_names.each do |table_name|
  path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}..."
    require path
  end
end
