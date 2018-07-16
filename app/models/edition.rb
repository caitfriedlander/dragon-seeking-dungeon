class Edition < ApplicationRecord
    has_many :user_editions
    has_many :users, through: :user_editions
end
