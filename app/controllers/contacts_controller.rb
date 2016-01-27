class ContactsController < ApplicationController
	layout 'user'

	def index
		@contacts = @current_user.contacts.where deleted: 0
	end

	def show
    @page_body_id = 'contact_detail_page'
    @contact = @current_user.contacts.where(id: params[:id]).first
    @notes = ContactNote.where(contact_id: @contact.id).reverse
    #@reminders = ContactReminder.where contact_id: @contact.id
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

  # methods to handle notes
  def notes

  end

  def create_note
    @contact = @current_user.contacts.where(id: params[:contact_id]).first
    @note = @contact.contact_notes.create get_new_note_params
    render layout: false
  end

  def update_note
    ContactNote.update params[:id], contact_id: params[:contact_id], content: params[:content]
    render :json => {:message => 'Ok'}, :layout => false
  end

  def delete_notes

  end

  # methods to handle reminders
  def reminders

  end

  def create_reminder

  end

  def update_reminder

  end

  def delete_reminders

  end

  private

  def confirm_contact_fields
    params.require(:contact).permit(:name, :email, :mobile, :dob, :gender, :city, :state, :country, :zip)
  end

  def get_notes

  end

  def get_new_note_params
    params.require(:note).permit(:content, :color)
  end
end
