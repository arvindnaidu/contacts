class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :setup_user

  protected

  def setup_user
    if session[:account_id].present?
      @current_user = Account.find(session[:account_id]) rescue nil
    end
  end
end
