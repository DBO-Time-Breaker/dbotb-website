class Character < DboChar
  self.primary_key = :CharID
  belongs_to :account, foreign_key: :AccountID
end
