class UserInformationsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def edit
    @info = UserInformation.find(params[:id])
  end

  def update
    @info = UserInformation.find(params[:id])
    if @info.update(info_params)
      flash[:success] = "Information updated"
      render 'edit'
    else
      render 'edit'
    end
  end

  def show
    @info = UserInformation.find(params[:id])
  end

  private
    def info_params
      params.require(:user_information).permit(:nickname, :school)
    end

    def logged_in_user
      #unless logged_in?
      #  flash[:danger] = "Please log in."
      #  redirect_to login_url
      #end
    end
end
