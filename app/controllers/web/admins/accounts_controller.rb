module Web
  module Admins
    class AccountsController < BaseController
      def index
        @accounts = query_accounts.accounts
      end

      def add_cash_points
        @add_cash_points_form = Forms::Admins::Accounts::AddCashPointsForm.new
      end

      def add_cash_points_submit
        @add_cash_points_form = Forms::Admins::Accounts::AddCashPointsForm.new(add_cash_points_params)

        if @add_cash_points_form.call
          redirect_to admins_accounts_path, notice: 'Cash points added successfully!'
        else
          redirect_to admins_accounts_add_cash_points_path, alert: @add_cash_points_form.errors.full_messages.join('<br>')
        end
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

      def add_cash_points_params
        {
          account_id: pa[:account_id],
          cash_points: pa[:form][:cash_points]
          reason: pa[:form][:reason],
          admin: current_user
        }
      end
    end
  end
end
