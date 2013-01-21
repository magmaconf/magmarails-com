class ContactsController < ApplicationController
  def create
    @section = params[:section]
    contact = Contact.new params[:contact]

    if contact.valid?
      contact.send_email
      notice = 'Your message has been sent.'
      alert = nil
    else
      notice = nil
      alert = contact.errors.full_messages.join ','
    end
    redirect_to root_path(section: @section, anchor: 'contactus'), alert: alert, notice: notice
  end
end
