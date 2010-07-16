# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :autorizar, :except => :login
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  layout "loja"

protected
  def autorizar
    unless Usuario.find_by_id(session[:usuario_id])
      session[:original_uri] = request.request_uri
      flash[:notice] = 'Favor realizar o log in'
      redirect_to :controller => 'admin', :action => 'login'
    end
  end
  
end