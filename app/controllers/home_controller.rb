class HomeController < ApplicationController
	layout 'user'

	def show

	end

  def logout
    session[:account_id] = nil
    redirect_to root_path
  end

  def profile

  end

  def settings

  end

  def trash
    @contacts = Contact.where deleted: 1
  end
end
