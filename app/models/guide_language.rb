class GuideLanguage < ActiveRecord::Base
    belongs_to :guide
    belongs_to :language_skill
    belongs_to :language_code
end
