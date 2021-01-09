class UsersController < ApplicationController
  layout 'auth', only: [:new]
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :auth_check, only: [:index, :show, :edit, :update]
  

def index
  @user = User.all
end

def show
end

def edit
end

def destroy
  @user = User.find(params[:id])
  unless @user.nil?
    @user.destroy
    respond_to do |format|
      format.html { redirect_to(users_path, flash: { success: '该记录已被删除' }) }
      format.xml  { head :ok }
    end
  else
    flash.now[:danger] = '未成功操作，请检查用户是否存在'
    redirect_to users_path
  end
end

def update
  if @user_info.update(info_params)
    flash[:success] = "个人信息成功更新"
    render 'show'
  else
    flash[:danger] = @user_info.errors.full_messages
    render 'show'
  end
end

def new
    @user = User.new
end

def create
    @user = User.new(user_params)
    @user.grant = Grant.find(2)
    if @user.save
      log_in @user
      redirect_to user_url(@user)
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to signup_path
    end
end

private

  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
    @user_info = @user.user_information
    if @user_info.nil?
      @user_info = UserInformation.create(user_id: @user.id, nickname: "Geek", school: "none")
    end
  end

  def info_params
    params.require(:user_information).permit(:nickname, :school)
  end

  def auth_check
    unless is_admin? || is_current_user?(@user)
      flash[:danger] = "您没有权限访问指定页面"
      redirect_to current_user
    end
  end
end
