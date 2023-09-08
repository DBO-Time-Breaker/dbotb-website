class Account < ApplicationRecord
  self.primary_key = :AccountID
  validates :email, length: {maximum: 80}
  validates :Username, presence: true, uniqueness: true, length: {maximum: 16}
end
