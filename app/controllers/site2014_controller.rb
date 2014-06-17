class Site2014Controller < ApplicationController
  include HighVoltage::StaticPage

  layout '2014/application'

  def send_email
    TransactionMailer.sponsor_mail(params).deliver
    render nothing: true
  end
end
