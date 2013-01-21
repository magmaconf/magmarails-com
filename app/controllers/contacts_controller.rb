class ContactsController < ApplicationController
  def create
    @section = params[:section]
    contact = Contact.new params[:contact]

    if contact.valid?
      contact.send_email
      contact.add_to_list
      notice = 'You will recive the Prospectus soon.'
      alert = nil
    else
      notice = nil
      alert = contact.errors.full_messages.join ','
    end
    redirect_to '/sponsoring', alert: alert, notice: notice
  end
end
