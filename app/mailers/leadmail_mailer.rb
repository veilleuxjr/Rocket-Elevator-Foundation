class LeadmailMailer < ApplicationMailer
    default from: 'no-reply@Rocketelevator.com'
    layout 'mailer'

    def welcome_email(lead)
        @lead = lead
        
        mail(:to => lead.email,
            subject: "New User Signup: #{@lead.email}")
      end

end
