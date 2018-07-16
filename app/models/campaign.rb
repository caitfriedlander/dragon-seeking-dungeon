class Campaign < ApplicationRecord
    belongs_to :user
    has_many :campaign_modules
    has_many :story_modules, through: :campaign_modules
end
