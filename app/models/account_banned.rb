class AccountBanned < DboAcc
  self.table_name = 'accounts_banned'

  belongs_to :banned_acc, class_name: 'Account', foreign_key: :Banned_AccId, primary_key: :AccountID
  belongs_to :banned_by, class_name: 'Account', foreign_key: :GM_AccId, primary_key: :AccountID
end
