module Web
  module Admins
    class BaseController < ApplicationController
      before_action :require_admin

      layout "web/admins/layouts/application"
    end
  end
end
