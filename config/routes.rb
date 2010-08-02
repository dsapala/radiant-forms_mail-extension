ActionController::Routing::Routes.draw do |map|
  map.create_mail '/pages/:id/mail', :controller => 'form_mail', :action => 'create'
end