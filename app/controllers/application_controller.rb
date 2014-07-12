class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  after_filter :set_access_control_headers
end

def set_access_control_headers 
    headers['Access-Control-Allow-Origin'] = 'http://10.16.20.229:8000'
    headers['Access-Control-Request-Method'] = '*' 
end
