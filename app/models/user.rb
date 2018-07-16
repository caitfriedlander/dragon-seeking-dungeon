class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :age, presence: true
    validates :zipcode, presence: true

    after_initialize :set_defaults

    private

    def set_defaults
        self.active = true if self.active.nil?
    end
end