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
        subject: 'Sponsors',
        html: (haml :'mails/sponsors', layout: false)
      }
      mandrill = Mandrill::API.new(ENV['MANDRILL_API_KEY'])
      mandrill.messages.send message
      { sent: true }

    rescue Mandrill::Error => e
      { sent: false }
    end
  end
end

