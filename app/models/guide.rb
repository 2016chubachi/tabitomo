class Guide < ActiveRecord::Base
    belongs_to :member
    accepts_nested_attributes_for :member

    has_many :bookings
    has_many :guide_cities
    has_many :guide_languages
    has_many :licence_pictures
end
