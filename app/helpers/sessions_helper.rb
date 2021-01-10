module SessionsHelper
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end

    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end
    
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def is_current_user? user
        current_user.id == user.id
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    def is_admin?
        logged_in? && admin?(current_user)
    end

    def is_valid_user?
        logged_in? && valid_user?(current_user) && !is_admin?
    end

    def is_not_valid_user?
        logged_in? && not_valid_user?(current_user) && !is_admin?
    end

    def is_valid_not_pass_user?
        logged_in? && valid_not_pass_user?(current_user) && !is_admin?
    end

    def can_upload?
        (logged_in? && current_user.grant.sys_upload) || is_admin?
    end

    def admin? user
        user.grant.sys_admin
    end

    def valid_user? user
        user.grant.sys_read && !is_admin?
    end

    def not_valid_user? user
        user.grant.id == 2
    end

    def valid_not_pass_user? user
        user.grant.id == 3
    end
end
