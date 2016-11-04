class Traveler < ActiveRecord::Base
    belongs_to :member
    has_many :bookings
end
