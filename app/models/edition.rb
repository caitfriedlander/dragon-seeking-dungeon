class Edition < ApplicationRecord
    has_many :user_editions, dependent: :destroy
    has_many :users, through: :user_editions
    has_many :campaigns, dependent: :destroy
end
