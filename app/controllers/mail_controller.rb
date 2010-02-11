module MailController
  
  attr_accessor :result
  
  def process_form_with_mail(form, parts, data)
    
    form.results << mail!(form, parts, data)
    
    process_form_without_mail(form, parts, data)
    
  end
  
  def mail!(form, parts, data)
    
    unless parts.config.nil? or parts.config[:mail].nil?
      mail = Mail.new(form, parts, data)
      10.times { puts "\n"}
      puts mail.inspect
      2.times { puts "\n"}
      mail.send
      2.times { puts "\n"}
      puts mail.sent?
    end
    
    [%(mail=#{mail.sent? ? "true" : "false"})]
    
  end
  
end