class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  Role.all.each do |role|
    define_method("authorize_#{role.name}") do
      if !current_user.roles.collect{ |r| r.name }.include?(role)
        render template: 'devise/401'
      end
    end
  end
end
