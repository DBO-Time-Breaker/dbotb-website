class AddCashPointsLog < ActiveRecord::Base
  belongs_to :account, foreign_key: :account_id, primary_key: :AccountID
  belongs_to :admin, foreign_key: :admin_id, primary_key: :AccountID
end
