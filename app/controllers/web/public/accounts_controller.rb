module Web
  module Public
    class AccountsController < ApplicationController

      def index
        @account = ::Forms::Accounts::LoginForm.new
      end
    
      def login_submit
        @account = ::Forms::Accounts::LoginForm.new(login_form_params)
    
        if @account.call
          auto_login(@account.account)
          redirect_to root_path
        else
          redirect_to root_path, alert: @account.errors.full_messages.join('<br>')
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
