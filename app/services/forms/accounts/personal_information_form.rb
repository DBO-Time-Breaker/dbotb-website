module Forms
  module Accounts
    class PersonalInformationForm
      require 'digest/md5'
  
      include Virtus.model
      include ActiveModel::Model

      attribute :account, Account
      attribute :email, String
      attribute :password, String

      validates :account, presence: true
      validates :password, presence: true
  
      validates :email, 'valid_email_2/email': { mx: true,
                                                 message: "Doesn't look like a valid email address" },
                        presence: { message: "Email can't be blank" }


      validate :email_is_the_same
      validate :email_is_unique
      validate :valid_credentials
  
      def call
        return false unless valid?

        Account.transaction do
          create_log
          update_personal_information
        end
        true
      end
  
      private

      def create_log
        PersonalInformationsLog.create!(
          account: account,
          field: "email",
          old_value: account.email,
          new_value: email
        )
      end

      def update_personal_information
        account.email = email.downcase

        account.save!
      end
  
      def valid_credentials
        return if account.valid_password?(encrypted_password)

        errors.add(:base, "Password isn't correct.")
      end

      def encrypted_password
        Digest::MD5.hexdigest(password)
      end

      def email_is_the_same
        return unless same_email?

        errors.add(:email, "is the same as the current one")
      end
  
      def email_is_unique
        return if email.blank?
        return if same_email?
        return unless Account.find_by(email: email.downcase).present?
  
        errors.add(:email, "is already taken")
      end

      def same_email?
        account.email&.downcase.eql?(email.downcase)
      end
    end
  end
end
