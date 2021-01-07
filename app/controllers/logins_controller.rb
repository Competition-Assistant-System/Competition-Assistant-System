class LoginsController < ApplicationController
    def new
        @user = User.new
      end

    def register
        @user = User.new(user_params)
        if @user.save
          redirect_to user_url(@user)
        else
          @user.errors.full_messages
          render 'new'
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
