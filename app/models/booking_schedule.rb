class BookingSchedule < ActiveRecord::Base
    belongs_to :booking
    belongs_to :city_master

    validates :traveler_count, :traveler_date,:city_master_id,  presence: true
    validates :traveler_count, numericality: { only_integer: true, greater_than: 0}
    # validates :traveler_count, numericality: { only_integer: true, greater_than: 0, message: :invalid_traveler_count }
    validates :traveler_date, uniqueness: {scope: "booking_id"}

end
