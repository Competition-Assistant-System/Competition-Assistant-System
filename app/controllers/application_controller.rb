class ApplicationController < ActionController::Base
    include SessionsHelper

    before_action :require_login
 
    private
    
    def require_login
        unless logged_in?
            store_location
            flash[:danger] = "您必须登录才能访问指定页面"
            redirect_to login_path # halts request cycle
        end
    end
end
