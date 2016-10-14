class BookingComment < ActiveRecord::Base
    belongs_to :member
    belongs_to :booking
end
