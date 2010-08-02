= Forms Mail Extension for Radiant

Forms mail is a hook for http://github.com/squaretalent/radiant-forms-extension.git

== Setup

Delete the following line in config/environment.rb

    config.frameworks -= [ :action_mailer ]
    
or just remove the :action_mailer references

    config.frameworks -= []


== Config

Define your mailing variables 

_hardcoded_

    mail:
      recipients: email@email.com
      from: email@email.com
      sender: email@email.com
      subject: subject text
      
_variable_
      
    mail:
      field:
        from: person[email]
        recipients: person[email]
        reply_to: person[email]
        sender: person[email]
        subject: contact[subject]

== SMTP

Of course you are probably using sendgrid to make sending emails easy, 
but if you're using SMTP create the following to **/config/initializers/forms_mail.rb**

    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.raise_delivery_errors = true
    ActionMailer::Base.smtp_settings = {
      :enable_starttls_auto =>  true,
      :address              =>  "smtp.gmail.com",
      :port                 =>  "587",
      :domain               =>  "smtp.gmail.com",
      :authentication       =>  :plain,
      :user_name            =>  "username@gmail.com",
      :password             =>  "password"
    }