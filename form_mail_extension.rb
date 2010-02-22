class FormMailExtension < Radiant::Extension
  version "0.3"
  description "Provides support for email forms and generic mailing functionality."
  url "http://github.com/squaretalent/radiant-mail-extension"
  #config "mailing.stmp.user mailing.smtp.pass"

  define_routes do |map|
    map.resources :mail, :path_prefix => "/pages/:page_id", :controller => "mail"
  end

  extension_config do |config|
    # Force smtp for Action Mailer on the server
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.raise_delivery_errors = true
    ActionMailer::Base.smtp_settings = {
      :enable_starttls_auto => true,
      :address =>           Radiant::Config['mail.server'],
      :port =>              Radiant::Config['mail.port'],
      :domain =>            Radiant::Config['mail.server'],
      :authentication =>    :plain,
      :user_name =>         Radiant::Config['mail.user'],
      :password =>          Radiant::Config['mail.pass']
    }
  end

  def activate
    FormController.class_eval do
      include MailController
      alias_method_chain :process_form, :mail
    end
  end
end