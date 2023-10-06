module ApplicationHelper
  def title(title)
    content_for :app_title do
      "#{title} | DBO Time Breaker"
    end
  end
end
