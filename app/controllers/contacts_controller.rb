class ContactsController < ApplicationController
  respond_to :js
  def create
    @section = params[:section]
    contact = Contact.new params[:contact]

    if contact.valid?
      contact.send_email
      contact.add_to_list
      @message = {:notice => "thanks for be interested, we'll send you the full prospectus via email."}
    else
      @message = {:alert => (contact.errors.full_messages.join ',') }
    end

    respond_with

  end
end
