module Api
  class AccountsController < ApplicationController
    require 'digest/md5'
  
    def register
      @account = Account.new(
        email: account_params[:email],
        Username: account_params[:username],
        Password_hash: Digest::MD5.hexdigest(account_params[:password])
      )
  
      if @account.save
        render json: @account, status: :created
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def account_params
      params.require(:account).permit(:email, :password, :username)
    end
  end
end
