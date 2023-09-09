module Forms
  module Accounts
    class RegistrationForm
      require 'digest/md5'
  
      include Virtus.model
      include ActiveModel::Model
  
      attribute :email, String
      attribute :username, String
      attribute :password, String
      attribute :password_confirmation, String
  
      validates :email, 'valid_email_2/email': { mx: true,
                                                 message: "Doesn't look like a valid email address" },
                        presence: { message: "Email can't be blank" }
      validates :username, presence: true, length: {maximum: 16}
      validates :password, presence: true, length: {minimum: 8}
      validates :password_confirmation, presence: true, length: {minimum: 8}
  
      validate :email_is_unique
      validate :username_is_unique
      validate :passwords_match
  
      def call
        return false unless valid?
  
        create_account
      end
  
      private
  
      def create_account
        account.email = email.downcase
        account.Username = username
        account.Password_hash = encrypted_password
        account.save
      end
  
      def account
        @account ||= Account.new(
          mallpoints: 0
        )
      end
  
      def encrypted_password
        Digest::MD5.hexdigest(password)
      end
  
      def email_is_unique
        return unless Account.find_by(email: email.downcase).present?
  
        errors.add(:email, "is already taken")
      end
  
      def username_is_unique
        return unless Account.find_by(Username: username).present?
  
        errors.add(:username, "is already taken")
      end
  
      def passwords_match
        return if password.eql?(password_confirmation)
  
        errors.add(:password_confirmation, "does not match")
      end
    end
  end
end
