class ApplicationController < ActionController::Base
    # Prevents CSRF attacks by raising an exception.
    protect_from_forgery with: :exception
    
    include ApplicationHelper
end
