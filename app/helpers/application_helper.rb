module ApplicationHelper
  def cp(path)
    "acitve" if current_page?(path)
  end
end
