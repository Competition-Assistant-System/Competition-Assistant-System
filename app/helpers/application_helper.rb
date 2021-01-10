module ApplicationHelper
  include ActiveLinkToHelper
  include TemplateNavHelper

  def get_current_year
    DateTime.parse(Time.now.to_s).strftime('%Y').to_s
  end

  def user_type_class
    if is_admin?
      return 'badge-primary'
    end
    if is_valid_not_pass_user?
      return 'badge-warning'
    end
    if is_not_valid_user?
      return 'badge-info'
    end
    return 'badge-secondary'
  end

end
