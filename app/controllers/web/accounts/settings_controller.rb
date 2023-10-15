module Web
  module Accounts
    class SettingsController < ApplicationController
      before_action :require_account

      def index
        @personal_informations_form = Forms::Accounts::PersonalInformationForm.new
      end

      def update_personal_informations
        @personal_informations_form ||= personal_informations_form
        if @personal_informations_form.call
          redirect_to settings_path, notice: "Personal informations updated"
        else
          redirect_to settings_path, alert: @personal_informations_form.errors.full_messages.join("<br>")
        end
      end

      def change_password
        @change_password_form = Forms::Accounts::ChangePasswordForm.new
      end

      def update_password
        @change_password_form = change_password_form
        if @change_password_form.call
          redirect_to settings_change_password_path, notice: "Password updated"
        else
          redirect_to settings_change_password_path, alert: @change_password_form.errors.full_messages.join("<br>")
        end
      end

      private

      def personal_informations_form
        Forms::Accounts::PersonalInformationForm.new(personal_informations_form_params)
      end

      def personal_informations_form_params
        {
          email: params[:form][:email],
          password: params[:form][:password],
          account: current_user
        }
      end

      def change_password_form
        Forms::Accounts::ChangePasswordForm.new(change_password_form_params)
      end

      def change_password_form_params
        {
          account: current_user,
          current_password: params[:form][:current_password],
          password: params[:form][:password],
          password_confirmation: params[:form][:password_confirmation]
        }
      end
    end
  end
end
