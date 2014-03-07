module SponsorsHelper
  def send_email
    begin
      message = {
        from_name: 'Magma Conf',
        to:[
          {
            email: ENV['JP_EMAIL'],
          },
          {
            email: ENV['ANA_EMAIL'],
          }
        ],
        from_email: "info@magmaconf.com",
      }
      message.merge!( is_newsletter ? newsletter_email : sponsor_email )
      mandrill = Mandrill::API.new(ENV['MANDRILL_API_KEY'])
      mandrill.messages.send message
      { sent: true }

    rescue Mandrill::Error => e
      { sent: false }
    end
  end

  def sponsor_email
    {
      subject: 'Sponsors',
      html: (haml :'mails/sponsors', layout: false)
    }
  end

  def newsletter_email
    {
      subject: 'Newsletter',
      html: (haml :'mails/newsletter', layout: false)
    }
  end

  def is_newsletter
    params[:type] == 'newsletter'
  end
end

