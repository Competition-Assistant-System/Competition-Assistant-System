class UsersController < ApplicationController
  layout 'auth', only: [:new]
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, except: [:index, :new, :create]
  before_action :auth_check, except: [:new, :create]
  before_action :admin_check, only: [:approve, :disapprove]
  
def index
  @user = User.all
end

def show
end

def edit
end

def destroy
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
    respond_to do |format|
      format.html { redirect_to(@user, flash: { success: '个人信息成功更新' }) }
      format.xml  { head :ok }
    end
  else
    respond_to do |format|
      format.html { redirect_to(@user, flash: { danger: @user_info.errors.full_messages }) }
      format.xml  { head :ok }
    end
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

def update_pwd
  if @user.update(user_password)
    respond_to do |format|
      format.html { redirect_to(@user, flash: { success: '密码成功更新' }) }
      format.xml  { head :ok }
    end
  else
    respond_to do |format|
      format.html { redirect_to(@user, flash: { danger: @user_info.errors.full_messages }) }
      format.xml  { head :ok }
    end
  end
end

# approve the application
def approve
  unless admin?(@user) then
    @user.grant = Grant.find(1)
    if @user.save
      respond_to do |format|
        format.html { redirect_to(@user, flash: { success: '成功通过申请' }) }
        format.xml  { head :ok }
      end
    else
      respond_to do |format|
        format.html { redirect_to(@user, flash: { danger: @user.errors.full_messages }) }
        format.xml  { head :ok }
      end
    end
  else
    respond_to do |format|
      format.html { redirect_to(@user, flash: { danger: '您不能对管理员操作' }) }
      format.xml  { head :ok }
    end
  end
end

# disapprove the application
def disapprove
  unless admin?(@user) then
      @user.grant = Grant.find(3)
      if @user.save
        respond_to do |format|
          format.html { redirect_to(@user, flash: { success: '成功拒绝申请' }) }
          format.xml  { head :ok }
        end
      else
        flash[:danger] = @user.errors.full_messages
        redirect_to @user
      end
  else
    respond_to do |format|
      format.html { redirect_to(@user, flash: { danger: '您不能对管理员操作' }) }
      format.xml  { head :ok }
    end
  end
end

private

  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def user_password
    params.require(:user).permit(:password, :password_confirmation)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by_id(params[:id])
    if @user.nil?
      flash[:danger] = "访问了错误的页面"
      redirect_to current_user
    else
      @user_info = @user.user_information
      if @user_info.nil?
        @user_info = UserInformation.create(user_id: @user.id, nickname: "Geek", school: "none")
      end
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

  def admin_check
    unless is_admin?
      flash[:danger] = "需要管理员权限"
      redirect_to current_user
    end
  end
end
