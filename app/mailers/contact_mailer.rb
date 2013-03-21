 class ContactMailer < MandrillMailer::TemplateMailer
   default from: 'info@magmaconf.com'

   def send_mail(args)
    @name = args.attributes[:name]
    @to = args.attributes[:email]
     mandrill_mail template: 'prospectus',
       subject: 'MagmaConf prospectus',
       to: {email: @to, name: @name},
       vars: {
         'OWNER_NAME' => @name
       }
   end
 end
