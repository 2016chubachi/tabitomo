class BookingSchedule < ActiveRecord::Base
    belongs_to :booking
    belongs_to :city_master
end
