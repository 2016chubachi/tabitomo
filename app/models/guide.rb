class Guide < ActiveRecord::Base
    belongs_to :member
    accepts_nested_attributes_for :member, update_only: true

    has_many :bookings
    has_many :guide_cities
    accepts_nested_attributes_for :guide_cities, allow_destroy: true
    has_many :guide_languages
    accepts_nested_attributes_for :guide_languages, allow_destroy: true

    has_one :licence_picture, dependent: :destroy
    accepts_nested_attributes_for :licence_picture, allow_destroy: true
end
