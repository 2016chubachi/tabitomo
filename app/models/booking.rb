class Booking < ActiveRecord::Base
    belongs_to :traveler
    belongs_to :guide
    belongs_to :status_master

    has_many :booking_schedules, dependent: :destroy
    accepts_nested_attributes_for :booking_schedules, allow_destroy: true

    has_one :user_review, dependent: :destroy

    has_one :traveler_booking_comment, dependent: :destroy
    accepts_nested_attributes_for :traveler_booking_comment, allow_destroy: true

    has_one :guide_booking_comment, dependent: :destroy
    accepts_nested_attributes_for :guide_booking_comment, allow_destroy: true

end
