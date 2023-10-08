class Account < DboAcc
  self.primary_key = :AccountID
  validates :email, length: {maximum: 80}
  validates :Username, presence: true, uniqueness: true, length: {maximum: 16}

  has_many :characters, foreign_key: :AccountID
end
