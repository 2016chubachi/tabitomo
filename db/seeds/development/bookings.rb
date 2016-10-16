#bookings
#statusはstatusmasterを参照した方が良い?
#bookingsのtraveler_countryはcountriesを参照した方が良い？
#参照する場合はテーブル項目定義を変更して、modelにリレーションを作成する必要あり
Booking.create(
  traveler_id: 4,
  guide_id: 1,
  traveler_first_name: "Saori",
  traveler_last_name: "To",
  traveler_email: "a15xx@aiit.ac.jp",
  traveler_telphone:"080-1234-5678"
)
Booking.create(
  traveler_id: 5,
  guide_id: 2,
  traveler_first_name: "Kenya",
  traveler_last_name: "Okada",
  traveler_email: "a15xx@aiit.ac.jp",
  traveler_telphone:"080-1234-5678"
)
