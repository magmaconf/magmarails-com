class SiteController < ApplicationController
  include HighVoltage::StaticPage

  layout :set_layout

  def send_email
    TransactionMailer.sponsor_mail(params).deliver
    render nothing: true
  end

  private
  def set_layout
    is2014? && '2014/application' || '2015/application'
  end

  def is2014?
    params[:id].match(/^2014/)
  end
end
