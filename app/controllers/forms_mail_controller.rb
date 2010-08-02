# Extend FormExtensionController so that the initializer creates the 
# default instance variables of @form, @data, and @page

class FormsMailController < FormsExtensionController
  
  # Called by FormController only if @form[:config] contains mail:
  #----------------------------------------------------------------------------
  def create
    mail = Mail.new(@form, @page)
    mail.create
    
    result = {
      :sent     => mail.sent?,
      :message  => mail.message,
      :subject  => mail.subject,
      :from     => mail.from
    }
  end
    
end