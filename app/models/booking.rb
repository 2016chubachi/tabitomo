class Booking < ActiveRecord::Base
    belongs_to :traveler
    belongs_to :guide
    
    has_many :booking_comments
    has_many :booking_schedules
    has_many :user_reviews
end
