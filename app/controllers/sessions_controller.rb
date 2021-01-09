class SessionsController < ApplicationController
  layout 'auth'
  skip_before_action :require_login, only: [:new, :create]
  
  def new
    if logged_in? 
      flash[:warning] = '您已经登录'
      redirect_to current_user
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_back_or user
    else
      flash[:danger] = '错误的用户名/密码' # 不完全正确
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
