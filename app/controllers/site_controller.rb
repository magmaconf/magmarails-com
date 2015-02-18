class SiteController < ApplicationController
  include HighVoltage::StaticPage

  layout "2015/application"

  def send_email
    TransactionMailer.sponsor_mail(params).deliver
    render nothing: true
  end
end
