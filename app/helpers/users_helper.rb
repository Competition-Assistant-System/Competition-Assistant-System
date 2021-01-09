module UsersHelper
    def get_user_auth user
        grant = user.grant
        grant.group_name
    end

    def valid_color user
        if not_valid_user?(user) 
            return 'table-info'
        end
        if valid_not_pass_user?(user)
            return 'table-warning'
        end
    end
end
