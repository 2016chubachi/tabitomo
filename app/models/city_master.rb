class CityMaster < ActiveRecord::Base
    has_many :guide_cities
    has_many :booking_schedules
end
