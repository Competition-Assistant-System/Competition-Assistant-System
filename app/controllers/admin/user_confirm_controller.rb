class Admin::UserConfirmController < ApplicationController
    def index
      # grant_id:
      # 0: admin
      # 1: normal participant
      # 2: not audited
      # 3: not passed
        @users = User.all
        @users_unaudit = @users.select{ |user| user.grant_id==2}
    end

    # approve the application
    def approve(user)
      if (user.grant_id!=0) then
        user.grant_id = 1
      else
        Logger.new("Admin should not applicate")
      end
        user.save
    rescue => exception
        Logger.new(exception)
    end

    # disapprove the application
    def disapprove(user)
        if(user.grant_id!=0) then
            user.grant_id = 1
        else
            Logger.new("Admin should not applicate")
        end
        user.save
    rescue => exception
        Logger.new(exception)
    end
end
