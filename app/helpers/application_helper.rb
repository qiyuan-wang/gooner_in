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
  
  def short_question_title(question)
    if question.title.length < 40
      question.title
    else
      question.title.slice(0, 30) + "..."
    end
  end
end
