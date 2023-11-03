module Web
  module Admins
    class AccountsController < BaseController
      def index
        @accounts = query_accounts.accounts
      end

      private

      def query_accounts
        @query_accounts ||= Query::Admins::Accounts.new(accounts_params)
      end

      def accounts_params
        prms = params.permit(:page, :per)

        prms.merge!(
          id: params[:search][:id],
          username: params[:search][:username],
          email: params[:search][:email],
          status: params[:search][:status],
          gm_level: params[:search][:gm_level],
        ) if params[:search].present?
        prms
      end
    end
  end
end
