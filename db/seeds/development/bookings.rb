#bookings
#statusはstatusmasterを参照した方が良い?
#bookingsのtraveler_countryはcountriesを参照した方が良い？
#参照する場合はテーブル項目定義を変更して、modelにリレーションを作成する必要あり
Booking.create(
  traveler_id: 1,
  status_master_id: 1,
  guide_id: 1,
  traveler_telphone:"070-1234-5678"
)
Booking.create(
  traveler_id: 1,
  status_master_id: 1,
  guide_id: 2,
  traveler_telphone:"080-1234-5678"
)
Booking.create(
  traveler_id: 2,
  status_master_id: 1,
  guide_id: 2,
  traveler_telphone:"090-1234-5678"
)
