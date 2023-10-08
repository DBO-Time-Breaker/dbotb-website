module ApplicationHelper
  def title(title)
    content_for :app_title do
      "#{title} | DBO Time Breaker"
    end
  end

  def scripts(&block)
    content_for(:extra_javascripts) do
      capture(&block)
    end
  end
end
