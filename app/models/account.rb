class Account < ApplicationRecord
  validates :email, length: {maximum: 80}
  validates :Username, length: {maximum: 16}
end
