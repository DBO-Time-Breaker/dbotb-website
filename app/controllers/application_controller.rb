class ApplicationController < ActionController::Base

  protected

  def require_account
    return true if current_user

    if request.xhr?
      render js: "window.location.replace('#{account_login_path}');"
    else
      redirect_to account_login_path
    end
    false
  end

  def require_anonymous_user
    return unless current_user

    redirect_error
  end

  def redirect_error(options = {})
    to = options.fetch(:to) { dashboard_path }
    alert = options.fetch(:alert, nil)

    flash[:alert] = alert if alert
    if request.xhr?
      render js: "window.location.href = '#{to}'"
    else
      redirect_to to
    end
    false
  end
end
