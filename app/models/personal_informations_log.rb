class PersonalInformationsLog < ActiveRecord::Base
  belongs_to :account, foreign_key: :account_id, primary_key: :AccountID

  enum field: {
    email: 'email',
    password_hash: 'password_hash'
  }
end
