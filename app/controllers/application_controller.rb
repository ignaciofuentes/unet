# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all
  helper_method :current_user_session, :current_user
  filter_parameter_logging :password, :password_confirmation
 # before_filter :require_user
  before_filter {|c| Authorization.current_user = c.current_user}
 before_filter :mailer_set_url_options
  def mailer_set_url_options
     ActionMailer::Base.default_url_options[:host] = request.host_with_port
   end
  
   def current_user
     return @current_user if defined?(@current_user)
     @current_user = current_user_session && current_user_session.record
   end 

	 def permission_denied
	store_location
	flash[:error]="No tiene privilegios para hacer eso"
	redirect_to login_url
	end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end 
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end    
end
