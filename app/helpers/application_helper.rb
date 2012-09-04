module ApplicationHelper
  #return the full title on a per-page basis
  def full_title(page_title)
    base_title = "Gooner.in - In Arsenal we trust."
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  def icon_tag_label(icon, title)
    raw "<i class=\"icon-#{icon} icon-white\"></i> #{title}"
  end
end
