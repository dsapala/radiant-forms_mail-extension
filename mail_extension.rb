class MailExtension < Radiant::Extension
  version "0.3"
  description "Provides support for email forms and generic mailing functionality."
  url "http://github.com/squaretalent/radiant-mail-extension"
  #config "mailing.stmp.user mailing.smtp.pass"

  define_routes do |map|
    map.resources :mail, :path_prefix => "/pages/:page_id", :controller => "mail"
  end

  def activate
    FormController.class_eval do
      include MailController
      alias_method_chain :process_form, :mail
    end
  end
end