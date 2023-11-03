class AddCashPointsLog < ActiveRecord::Base
  belongs_to :account, class_name: 'Account', foreign_key: :account_id, primary_key: :AccountID
  belongs_to :admin, class_name: 'Account', foreign_key: :admin_id, primary_key: :AccountID
end
