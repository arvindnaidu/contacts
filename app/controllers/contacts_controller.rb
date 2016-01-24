class ContactsController < ApplicationController
	layout 'user'

	def index
		@contacts = @current_user.contacts.where deleted: 0
	end

	def show
    @contact = @current_user.contacts.where(id: params[:id]).first
	end

	def new
    @contact = Contact.new
	end

	def create
    contact = @current_user.contacts.create confirm_contact_fields
    redirect_to contact_path(contact.id)
	end

  def edit
    @contact = @current_user.contacts.where(id: params[:id]).first
  end

	def update
    Contact.update params[:id], confirm_contact_fields
    flash.notice = "Contact was updated successfully!"
    redirect_to contact_path(params[:id])
	end

	def destroy
    contact =  @current_user.contacts.where(id: params[:id]).first
    contact.deleted = true
    contact.save!
    flash.notice = "Contact was deleted successfully"
    render :json => {:redirectToUrl => contacts_path}
	end

  private

  def confirm_contact_fields
    params.require(:contact).permit(:name, :email, :mobile, :dob, :gender, :city, :state, :country, :zip)
  end
end
