module Web
  module Public
    class AccountsController < ApplicationController
      before_action :require_anonymous_user, only: [:index, :login_submit]

      def index
        @account = ::Forms::Accounts::LoginForm.new
      end
    
      def login_submit
        @account = ::Forms::Accounts::LoginForm.new(login_form_params)
    
        if @account.call
          auto_login(@account.account)
          redirect_to dashboard_path
        else
          redirect_to account_login_path, alert: @account.errors.full_messages.join('<br>')
        end
      end

      def logout_submit
        logout
        redirect_to root_path
      end
    
      private
    
      def login_form_params
        {
          username: params[:account][:username],
          password: params[:account][:password]
        }
      end
    end
  end
end
