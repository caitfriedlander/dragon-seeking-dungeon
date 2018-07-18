class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :age, presence: true
    validates :zipcode, presence: true
   
    has_one_attached :image
    has_many :user_roles, dependent: :destroy
    has_many :roles, through: :user_roles, dependent: :destroy
    has_many :user_editions, dependent: :destroy
    has_many :editions, through: :user_editions, dependent: :destroy
    has_many :campaigns, dependent: :destroy
    has_many :signups, dependent: :destroy
    has_many :joined_campaigns, through: :signups

    after_initialize :set_defaults
    private

    def set_defaults
        self.active = true if self.active.nil?
    end
end