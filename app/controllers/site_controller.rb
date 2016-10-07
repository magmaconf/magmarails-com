class SiteController < ApplicationController
  include HighVoltage::StaticPage
  before_filter :set_year

  layout :set_layout

  def send_email
    TransactionMailer.sponsor_mail(params).deliver
    render nothing: true
  end

  def speakers
    @id = 'speakers'
    render "site/#{sanitize_year}/speakers.html.haml"
  end

  private
  def set_layout
    @year = sanitize_year
    "#{sanitize_year}/application"
  end

  def sanitize_year
    params[:year] ||= ENV["DEFAULT_YEAR"]
  end

  def set_year
    @year = sanitize_year
  end

end
