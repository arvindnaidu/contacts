class Contact < ActiveRecord::Base
  belongs_to :account
  has_many :contact_notes, dependent: :destroy
  has_many :contact_reminders, dependent: :destroy
end
