class NotesController < ApplicationController
  before_filter :set_contact

  def index
		@notes = @contact.contact_notes.where deleted: 0
	end

	def show
    @note = @contact.contact_notes.where(id: params[:id]).first
	end

	def new
    @note = ContactNote.new
	end

	def create
    note = @contact.contact_notes.create confirm_contact_fields
    redirect_to contact_path(note.id)
	end

  def edit
    @note = @contact.contact_notes.where(id: params[:id]).first
  end

	def update
    Contact.update params[:id], confirm_contact_fields
    flash.notice = "Contact was updated successfully!"
    redirect_to contact_path(params[:id])
	end

	def destroy
    note =  @contact.contact_notes.where(id: params[:id]).first
    note.deleted = true
    note.save!
    flash.notice = "Contact was deleted successfully"
    render :json => {:redirectToUrl => contacts_path}
	end

  private

  def confirm_contact_fields
    params.require(:contact).permit(:name, :email, :mobile, :dob, :gender, :city, :state, :country, :zip)
  end

  def set_contact
    @contact ||= @current_user.contacts.where(id: params[:contact_id]).first
  end
end
