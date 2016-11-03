class GuideBookingComment < ActiveRecord::Base
  belongs_to :guide
  belongs_to :booking
end
