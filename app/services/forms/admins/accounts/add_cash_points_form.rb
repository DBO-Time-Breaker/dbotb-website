module Forms
  module Admins
    module Accounts
      class AddCashPointsForm
    
        include Virtus.model
        include ActiveModel::Model
  
        attribute :account_id, Integer
        attribute :reason, String
        attribute :cash_points, Integer
        attribute :admin, Account

        validates :account_id, :reason, :cash_points, :admin, presence: true
        validates :cash_points, numericality: { greater_than: 0 }
        validate :account_exists
        validate :account_active
        validate :admin_is_gm
    
        def call
          return false unless valid?
  
          Account.transaction do
            create_log
            add_cash_points
          end
          true
        end
    
        private
  
        def create_log
          AddCashPointsLog.create!(
            account: account,
            admin: admin,
            reason: reason,
            cash_points: cash_points
          )
        end

        def add_cash_points
          account.mallpoints += cash_points
          account.save
        end

        def account
          @account ||= Account.find_by_id(account_id)
        end
    
        def account_exists
          return if account.present?
    
          errors.add(:base, 'Account not found')
        end

        def account_active
          return if account&.active?

          errors.add(:base, 'Account is not active')
        end

        def admin_is_gm
          return if admin&.admin_level?
    
          errors.add(:base, "You don't have permission to do this")
        end
      end
    end
  end
end
