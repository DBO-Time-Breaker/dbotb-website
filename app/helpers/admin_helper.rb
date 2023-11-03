module AdminHelper
  def status_color(status)
    case status
    when 'active'
      'green'
    when 'block'
      'red'
    when 'pending'
      'gray'
    else
      ''
    end
  end
end
