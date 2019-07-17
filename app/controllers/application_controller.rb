class ApplicationController < ActionController::Base
    def index
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!session[:user_id]
    end

    def require_login
        redirect_to '/signin' unless session.include? :user_id
    end

    helper_method :current_user, :logged_in?
end
