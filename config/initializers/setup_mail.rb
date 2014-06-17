ActionMailer::Base.smtp_settings = {
    address: "smtp.mandrillapp.com",
    port:     587
}

ActionMailer::Base.default content_type: "text/html"

MandrillMailer.configure do |config|
  config.api_key = ENV['MANDRILL_API_KEY']
end
