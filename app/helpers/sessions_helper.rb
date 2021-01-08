module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def is_current_user? user
        current_user.id == user
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    def is_admin?
        logged_in? && current_user.grant.sys_admin
    end

    def is_valid_user?
        logged_in? && current_user.grant.sys_read && !is_admin?
    end

    def is_not_valid_user?
        logged_in? && current_user.grant.id == 2
    end

    def is_valid_not_pass_user?
        logged_in? && current_user.grant.id == 3
    end
end
