module SponsorsHelper
  def send_email(params = {})
    begin
      message = {
      subject: 'Sponsors',
      from_name: 'MagmaConf',
      text:'Sponsors',
      to:[
          {
            email: ENV['JP_EMAIL'],
          },
          {
            email: ENV['ANA_EMAIL'],
          }
      ],
      html: "<h4>A potential sponsor is requesting information</h4>
               <p><b>Name:</b> #{params[:name]}</p>
               <p><b>Company:</b> #{params[:company]}</p>
               <p><b>Email:</b> #{params[:email]}</p>",
      from_email: "info@magmaconf.com"
      }
      mandrill = Mandrill::API.new(ENV['MANDRILL_API_KEY'])
      mandrill.messages.send message
      { sent: true }

    rescue Mandrill::Error => e
      { sent: false }
    end
  end
end

