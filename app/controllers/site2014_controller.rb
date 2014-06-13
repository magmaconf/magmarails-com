class Site2014Controller < ApplicationController
  include HighVoltage::StaticPage

  layout 'application_2014'

  def send_email
    TransactionMailer.sponsor_mail(params).deliver
    render nothing: true
  end
end
