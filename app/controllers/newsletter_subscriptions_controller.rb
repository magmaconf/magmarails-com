class NewsletterSubscriptionsController < ApplicationController
  def create
    TransactionMailer.newsletter_mail(params).deliver
    render nothing: true
  end
end
