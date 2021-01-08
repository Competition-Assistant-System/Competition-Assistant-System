module UsersHelper
    def get_user_auth user
        grant = user.grant
        grant.group_name
    end
end
