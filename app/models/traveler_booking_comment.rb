class TravelerBookingComment < ActiveRecord::Base
  belongs_to :traveler
  belongs_to :booking
end
