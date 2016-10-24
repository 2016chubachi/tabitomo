class UserReview < ActiveRecord::Base
    belongs_to :booking
    belongs_to :star_master
end
