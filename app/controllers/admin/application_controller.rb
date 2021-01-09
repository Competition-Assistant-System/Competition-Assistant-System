class Admin::ApplicationController < ApplicationController
    before_action :admin_auth_check
 
    private
    
    def admin_auth_check
        unless is_admin?
        flash[:danger] = "您没有访问的权限"
        redirect_to current_user
        end
    end
end
