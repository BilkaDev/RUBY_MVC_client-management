module ApplicationHelper
  def active_page(page)
    url_for(only_path: false).include? page
  end
end
