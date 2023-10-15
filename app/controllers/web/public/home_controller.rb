module Web
  module Public
    class HomeController < ApplicationController
      before_action :require_anonymous_user

      def index
        @account = ::Forms::Accounts::RegistrationForm.new
      end
    
      def account_register
        @account = ::Forms::Accounts::RegistrationForm.new(account_registration_form_params)
    
        if @account.call
          redirect_to root_path, notice: "Account created successfully!"
        else
          redirect_to root_path, alert: @account.errors.full_messages.join('<br>')
        end
      end
    
      private
    
      def account_registration_form_params
        {
          email: params[:account][:email],
          username: params[:account][:username],
          password: params[:account][:password],
          password_confirmation: params[:account][:password_confirmation]
        }
      end
    end
  end
end
