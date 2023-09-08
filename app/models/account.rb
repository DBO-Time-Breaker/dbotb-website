class Account < ApplicationRecord
  self.primary_key = :AccountID
  validates :email, length: {maximum: 80}
  validates :Username, length: {maximum: 16}
end
