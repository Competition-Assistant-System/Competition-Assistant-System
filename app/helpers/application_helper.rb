module ApplicationHelper
  include ActiveLinkToHelper
  include TemplateNavHelper

  def get_current_year
    DateTime.parse(Time.now.to_s).strftime('%Y').to_s
  end

end
