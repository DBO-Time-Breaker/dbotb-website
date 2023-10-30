class Account < DboAcc
  authenticates_with_sorcery!
  attr_reader :password

  self.primary_key = :AccountID
  attribute :isGm, ActiveModel::Type::Integer.new

  validates :email, length: {maximum: 80}
  validates :Username, presence: true, uniqueness: true, length: {maximum: 16}

  has_many :characters, foreign_key: :AccountID

  def self.find_by_id(id)
    Account.find_by(AccountID: id)
  end

  def valid_password?(password)
    password.eql?(self.Password_hash)
  end

  def admin_level?
    admin? && isGm.eql?(10)
  end
end
