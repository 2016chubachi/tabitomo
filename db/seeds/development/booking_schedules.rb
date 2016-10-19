#booking_schedules
#traveler_locationをcity_mastersを参照した方が良い？
#参照する場合はテーブル項目定義を変更して、modelにリレーションを作成する必要あり
BookingSchedule.create(
  booking_id: 1,
  traveler_count: 2,
  city_master_id: 1, #参照にしたら変更する
  traveler_date: Date.today
)

BookingSchedule.create(
  booking_id: 1,
  traveler_count: 2,
  city_master_id: 1, #参照にしたら変更する
  traveler_date: Date.today + 1
)

BookingSchedule.create(
  booking_id: 2,
  traveler_count: 2,
  city_master_id: 1, #参照にしたら変更する
  traveler_date: Date.today
)

BookingSchedule.create(
  booking_id: 2,
  traveler_count: 2,
  city_master_id: 1, #参照にしたら変更する
  traveler_date: Date.today + 1
)
