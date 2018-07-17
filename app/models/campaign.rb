class Campaign < ApplicationRecord
    belongs_to :user
    belongs_to :edition
end
