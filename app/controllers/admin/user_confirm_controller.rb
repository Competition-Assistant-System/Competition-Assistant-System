class Admin::UserConfirmController < ApplicationController
    def index
        @users = User.all
        @users_unaudit = @users # .select{ |user| user.@application.not_audit_yet?}
    end

    # approve the application
    def approve(user)
        # user.grant.set_participant
        # user.@application.approve!
        user.save
    rescue => exception
        Logger.new(exception)
    end

    # disapprove the application
    def disapprove(user)
        # user.@application.disapprove!
        # user.grant.set_common
        user.save
    rescue => exception
        Logger.new(exception)
    end
end
