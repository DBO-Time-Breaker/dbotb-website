module Web
  module Accounts
    class DashboardController < ApplicationController
      before_action :require_account

      def index
        @characters = current_user.characters
      end
    end
  end
end
