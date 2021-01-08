class UsersController < ApplicationController
  layout 'auth', only: [:new]
  before_action :set_user, only: [:show, :edit, :update]

def show
end

def edit
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
end
