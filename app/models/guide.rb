class Guide < ActiveRecord::Base
    belongs_to :member
    accepts_nested_attributes_for :member, update_only: true

    has_many :bookings
    has_many :guide_cities
    has_many :guide_languages
    has_many :licence_pictures, :dependent => :destroy
    accepts_nested_attributes_for :licence_pictures, :reject_if => :all_blank, :allow_destroy => true
    #https://sleekd.com/general/adding-multiple-images-to-a-rails-model-with-paperclip/ **
    #lambda { |t| t['licence_picture'].nil? }

end
