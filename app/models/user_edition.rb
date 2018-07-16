class UserEdition < ApplicationRecord
  belongs_to :user
  belongs_to :edition
end
