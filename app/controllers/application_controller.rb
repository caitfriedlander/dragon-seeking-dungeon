class ApplicationController < ActionController::Base
    private

    # Make the current_user method available to views, not just controllers!
    helper_method :current_user

    def current_user
        # this assigns the database query to a variable because you only want to
        # querry the DB once since DB lookups are so slow
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        # this has no value the first time you call it
    end

    def authorize
        redirect_to login_path, alert: 'Please log in!' unless current_user
    end
end
