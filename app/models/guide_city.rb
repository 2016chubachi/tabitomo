class GuideCity < ActiveRecord::Base
    belongs_to :guide
    belongs_to :city_master
end
