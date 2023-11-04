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

  def flash_color(key)
    case key
    when 'notice' then 'green'
    when 'alert' then 'red'
    when 'warning' then 'yellow'
    else 'yellow'
    end
  end
end
