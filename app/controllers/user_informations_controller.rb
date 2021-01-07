class UserInformationsController < ApplicationController

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

end
