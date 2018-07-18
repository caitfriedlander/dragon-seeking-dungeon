class Campaign < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :size, presence: true
    validates :edition, presence: true
    
    belongs_to :user
    belongs_to :edition

    has_many :signups, dependent: :destroy
    has_many :players, through: :signups
end
