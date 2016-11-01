class Booking < ActiveRecord::Base
    belongs_to :traveler
    belongs_to :guide
    belongs_to :status_master

    has_many :booking_comments
    accepts_nested_attributes_for :booking_comments, allow_destroy: true

    has_many :booking_schedules
    accepts_nested_attributes_for :booking_schedules, allow_destroy: true

    has_one :user_review

    has_one :traveler_booking_comment
    accepts_nested_attributes_for :traveler_booking_comment, allow_destroy: true
end
