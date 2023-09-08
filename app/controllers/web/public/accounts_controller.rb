module Web
  module Public
    class AccountsController < ApplicationController
      require 'digest/md5'
  
      def index
        @account = Account.new(
          email: ''
        )
      end
    
      def create
        @account = Account.new(
          email: account_params[:email],
          Username: account_params[:Username],
          Password_hash: Digest::MD5.hexdigest(account_params[:password])
        )
    
        if @account.save
          redirect_to account_index_path, notice: "Account created successfully!"
        else
          redirect_to account_index_path, alert: @account.errors.full_messages.join(', ')
        end
      end
    
      private
    
      def account_params
        params.require(:account).permit(:email, :password, :Username)
      end
    end
  end
end
