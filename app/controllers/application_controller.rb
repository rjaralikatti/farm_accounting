class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  def authorize_owner
    if !current_user.roles.collect{ |role| role.name }.include?('owner')
      render template: 'devise/401'
    end
  end
end
