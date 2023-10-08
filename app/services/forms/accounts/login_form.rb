module Forms
  module Accounts
    class LoginForm
      require 'digest/md5'
  
      include Virtus.model
      include ActiveModel::Model

      attribute :username, String
      attribute :password, String
  
      validates :username, presence: true, length: {maximum: 16}
      validates :password, presence: true, length: {minimum: 8}
  
      validate :username_exists
  
      def call
        return false unless valid?
  
        valid_credentials?
      end

      def account
        @account ||= Account.find_by(Username: username)
      end
  
      private
  
      def valid_credentials?
        return true if account.valid_password?(encrypted_password)

        errors.add(:base, "Credentials are invalid.")
        false
      end

      def encrypted_password
        Digest::MD5.hexdigest(password)
      end

  
      def username_exists
        return if account.present?
  
        errors.add(:base, "Account does not exist.")
      end
    end
  end
end
