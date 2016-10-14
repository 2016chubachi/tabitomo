class Guide < ActiveRecord::Base
    belongs_to :member
    
    has_many :bookings
    has_many :guide_cities
    has_many :guide_languages
    has_many :licence_pictures
end
