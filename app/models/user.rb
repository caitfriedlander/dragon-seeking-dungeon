class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :age, presence: true
    validates :zipcode, presence: true
   
    has_one_attached :image
    has_many :user_roles
    has_many :roles, through: :user_roles
    has_many :user_editions
    has_many :editions, through: :user_editions
    has_many :campaigns

    after_initialize :set_defaults
    private

    def set_defaults
        self.active = true if self.active.nil?
    end
end