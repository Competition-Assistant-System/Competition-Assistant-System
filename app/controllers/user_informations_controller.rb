class UserInformationsController < ApplicationController


  def edit
    @info = UserInformation.find(params[:id])
  end

  def create

  end

end
