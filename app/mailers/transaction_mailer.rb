class TransactionMailer < MandrillMailer::TemplateMailer
  default from: 'info@magmaconf.com', from_name: 'MagmaConf'

  def sponsor_mail(params)
    mandrill_mail template: 'sponsors',
                  subject: 'Sponsors',
                  to: [
                        { email: ENV['JP_EMAIL'] },
                        { email: ENV['ANA_EMAIL'] }
                  ],
                  vars: {
                      'USER_EMAIL' => params[:email],
                      'USER_COMPANY' => params[:company],
                      'USER_NAME' => params[:name]
                  },
                  important: true,
                  inline_css: true,
                  async: true
  end

  def newsletter_mail(params)
    mandrill_mail template: 'newsletter',
                  subject: 'Newsletter',
                  to: [
                        { email: ENV['JP_EMAIL'] },
                        { email: ENV['ANA_EMAIL'] }
                  ],
                  vars: {
                      'USER_EMAIL' => params[:email],
                      'USER_NAME' => params[:name]
                  },
                  important: true,
                  inline_css: true,
                  async: true
  end
end
