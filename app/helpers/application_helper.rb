module ApplicationHelper
  include Pagy::Frontend

  def nav_link_to(text, path, options = {})
    options[:class] = options[:class] || ""
    options[:class] += " #{options[:active_class]}" if current_page?(path)
    link_to text, path, options
  end
end
