class StoryModule < ApplicationRecord
    has_many :campaign_modules
    has_many :campaigns, through: :campaign_modules
end
