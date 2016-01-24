class AccountsController < ApplicationController
  layout false

  def update
    Account.update params[:id], confirm_account_fields
    flash.notice = "Profile was updated successfully!"
    redirect_to profile_path
	end

  private

  def confirm_account_fields
    params.require(:account).permit(:name, :email, :mobile, :dob, :gender, :city, :state, :country, :zip)
  end
end
