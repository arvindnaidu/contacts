class SessionsController < ApplicationController
  layout false

  def create
    email, password = params[:account][:email], params[:account][:password]
    account = Account.where(email: email, password: password).first
    redirect_to root_path
  end
end
