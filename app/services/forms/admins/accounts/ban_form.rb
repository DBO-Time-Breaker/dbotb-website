module Forms
  module Admins
    module Accounts
      class BanForm
    
        include Virtus.model
        include ActiveModel::Model
  
        attribute :account_id, Integer
        attribute :reason, String
        attribute :duration, Integer
        attribute :permanent, Boolean, default: false
        attribute :admin, Account

        validates :account_id, :reason, :admin, presence: true
        validates :duration, presence: true, unless: :permanent?
        validate :account_exists
        validate :account_can_be_banned
        validate :admin_is_gm
        validate :duration_is_valid
    
        def call
          return false unless valid?
  
          Account.transaction do
            create_account_ban
            change_account_status
          end
          true
        end
    
        private
  
        def create_account_ban
          AccountBanned.create!(
            banned_acc: account,
            banned_by: admin,
            Reason: reason,
            Duration: processed_duration,
            DateTime: Time.now,
            Active: true
          )
        end

        def change_account_status
          account.acc_status = 'block'
          account.save
        end

        def account
          @account ||= Account.find_by_id(account_id)
        end

        def processed_duration
          return 255 if permanent?

          duration
        end
    
        def account_exists
          return if account.present?
    
          errors.add(:base, 'Account not found')
        end

        def account_can_be_banned
          return if account&.can_be_banned?

          errors.add(:base, "Account can't be banned")
        end

        def duration_is_valid
          return if permanent?
          return if duration&.positive? && duration < 255

          errors.add(:base, 'Duration is invalid')
        end

        def admin_is_gm
          return if admin&.admin_level?
    
          errors.add(:base, "You don't have permission to do this")
        end
      end
    end
  end
end
