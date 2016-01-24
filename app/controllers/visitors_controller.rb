class VisitorsController < ApplicationController
	layout "visitor"

	def welcome

	end

  def signup
    @account = Account.new
  end

  def create
    account = Account.create! account_params
    session[:account_id] = account.id
    redirect_to root_path
  end

  def login
    email, password = params[:account][:email], params[:account][:password]
    account = Account.where(email: email, password: password).first
    session[:account_id] = account.id
    redirect_to home_page_path
  end

  private

  def account_params
    params.require(:account).permit(:name, :email, :password, :gender)
  end
end
