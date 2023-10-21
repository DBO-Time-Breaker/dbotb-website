module Forms
  module Accounts
    class ChangePasswordForm
      require 'digest/md5'
  
      include Virtus.model
      include ActiveModel::Model

      attribute :account, Account
      attribute :current_password, String
      attribute :password, String
      attribute :password_confirmation, String

      validates :account, presence: true
      validates :current_password, presence: true
      validates :password, presence: true, length: {minimum: 8}
      validates :password_confirmation, presence: true, length: {minimum: 8}

      validate :valid_credentials
      validate :passwords_match
      validate :old_password
  
      def call
        return false unless valid?

        Account.transaction do
          create_log
          update_password
        end
        true
      end
  
      private

      def create_log
        PersonalInformationsLog.create!(
          account: account,
          field: "password_hash",
          old_value: account.Password_hash,
          new_value: encrypted_password(password)
        )
      end

      def update_password
        account.Password_hash = encrypted_password(password)
        account.del_char_pw = encrypted_password(password)

        account.save!
      end
  
      def valid_credentials
        return if account.valid_password?(encrypted_password(current_password))

        errors.add(:base, "Current password isn't correct.")
      end

      def passwords_match
        return if password.eql?(password_confirmation)

        errors.add(:base, "Passwords don't match.")
      end

      def old_password
        return unless exists_old_password? || same_password?

        errors.add(:base, "You can't use an old password.")
      end

      def exists_old_password?
        PersonalInformationsLog.password_hash
          .where(
            account_id: account.AccountID,
            old_value: encrypted_password(password)
          ).exists?
      end

      def same_password?
        account.valid_password?(encrypted_password(password))
      end

      def encrypted_password(pwrd)
        Digest::MD5.hexdigest(pwrd)
      end
    end
  end
end
