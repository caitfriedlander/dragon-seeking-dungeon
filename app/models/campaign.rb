class Campaign < ApplicationRecord
    belongs_to :user
    belongs_to :edition

    has_many :signups, dependent: :destroy
    has_many :players, through: :signups
end
